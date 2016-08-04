<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\PackageHistory;
use Illuminate\Pagination\Paginator;

class PurchaseController extends BaseAdminController
{
    public $bodyClass = 'page-controller', $routeLink = 'purchase';

    public function __construct(){
        parent::__construct();

        $this->_setPageTitle('Purchase History', 'Purchase');
        $this->_setBodyClass($this->bodyClass);

        $this->_loadAdminMenu($this->routeLink);
    }

    public function getIndex(){
    	$this->_setBodyClass($this->bodyClass . ' pages-list-page');

        return $this->_viewAdmin('purchase');
    }

    public function postIndex(Request $request)
    {
        /**
         * Paging
         **/
        $offset = $request->get('start', 0);
        $limit = $request->get('length', 10);
        $paged = ($offset + $limit) / $limit;
        Paginator::currentPageResolver(function () use ($paged) {
            return $paged;
        });

        $records = [];
        $records["data"] = [];

        /*Group actions*/
        if ($request->get('customActionType', null) == 'group_action') {
            \DB::beginTransaction();
            
            $records["customActionStatus"] = "danger";
            $records["customActionMessage"] = "Group action did not completed. Some error occurred.";
            $ids = (array) $request->get('id', []);
            $result = $object->updateMultiple($ids, [
                'status' => $request->get('customActionValue', 0),
            ], true);
            if (!$result['error']) {
                $records["customActionStatus"] = "success";
                $records["customActionMessage"] = "Group action has been completed.";
                \DB::commit();
            } else {
                \DB::rollBack();
            }
        }

        /*
         * Sortable data
         */
        $orderBy = $request->get('order')[0]['column'];
        switch ($orderBy) {
            case 1:
                {
                    $orderBy = 'id';
                }
                break;
            case 2:
                {
                    $orderBy = 'user_id';
                }
                break;
            case 3:
                {
                    $orderBy = 'package';
                }
                break;
            default:
                {
                    $orderBy = 'created_at';
                }
                break;
        }
        $orderType = $request->get('order')[0]['dir'];

        $getByFields = [];
        if ($request->get('user_id', null) != null) {
            $getByFields['user_id'] = ['compare' => 'LIKE', 'value' => $request->get('user_id')];
        }


        $items = PackageHistory::searchBy($getByFields, [$orderBy => $orderType], true, $limit);

        $iTotalRecords = $items->total();

        $sEcho = intval($request->get('sEcho'));

        foreach ($items as $key => $row) {
        	$row->username;
            $records["data"][] = array(
                '<input type="checkbox" name="id[]" value="' . $row->id . '">',
                $row->id,
                $row->username->email,
                $row->package,
                $row->created_at->toDateTimeString(),
            );
        }

        $records["sEcho"] = $sEcho;
        $records["iTotalRecords"] = $iTotalRecords;
        $records["iTotalDisplayRecords"] = $iTotalRecords;

        return response()->json($records);
    }
}
