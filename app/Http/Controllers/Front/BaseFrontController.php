<?php
namespace App\Http\Controllers\Front;

use Acme;
use App\Http\Controllers\BaseController;
use App\Models;
use App\Models\ProductCategory;

abstract class BaseFrontController extends BaseController
{
    //To use cart functions, uncomment this line
    //use Cart;

    protected $dis = [], $bodyClass = '';

    public function __construct()
    {
        parent::__construct();
        if ($this->_showConstructionMode()) {
            abort(503);
        }
        $this->_setMetaSEO();

        $this->_SearchCategory();

        //To use cart functions, uncomment this line
        //$this->_getCart();
    }

    protected function _SearchCategory(){
        $categories = ProductCategory::where('status', '=', 1)->get();
        view()->share([
            'SearchCategory' => $categories,
        ]);
    }

    protected function _loadFrontMenu($menuActive = '', $type = 'custom-link')
    {
        $menu = new Acme\CmsMenu();
        $menu->localeObj = $this->currentLanguage;
        $menu->languageCode = $this->currentLanguage->language_code;
        $menu->args = array(
            'languageId' => $this->currentLanguageId,
            'menuName' => 'main-menu',
            'menuClass' => 'nav navbar-nav menu__list',
            'container' => '',
            'containerClass' => '',
            'containerId' => '',
            'containerTag' => 'ul',
            'childTag' => 'li',
            'itemHasChildrenClass' => 'dropdown menu__item',
            'subMenuClass' => 'dropdown-menu multi-column columns-3',
            'menuActive' => [
                'type' => $type,
                'related_id' => $menuActive,
            ],
            'activeClass' => 'active menu__item menu__item--current',
            'isAdminMenu' => false,
        );
        view()->share('CMSMenuHtml', $menu->getNavMenu());
    }

    protected function _setPageTitle($title)
    {
        view()->share([
            'pageTitle' => $title,
        ]);
    }

    protected function _setCurrentEditLink($title, $link)
    {
        view()->share([
            'currentFrontEditLink' => [
                'title' => $title,
                'link' => '/' . $this->adminCpAccess . '/' . $link,
            ],
        ]);
    }

    /**
     * @param Models\Foundation\MetaFunctions $modelObject
     * @param int $rules: $contentId
     **/
    protected function _getAllCustomFields($modelObject, $contentId)
    {
        $this->dis['currentObjectCustomFields'] = $modelObject->getAllContentMeta($contentId);
    }

    protected function _setMetaSEO($keywords = null, $description = null, $image = null)
    {
        $data = [];
        if ($keywords) {
            $data['keywords'] = $keywords;
        } else {
            $data['keywords'] = $this->_getSetting('site_keywords');
        }
        if ($description) {
            $data['description'] = $description;
        } else {
            $data['description'] = $this->_getSetting('site_keywords');
        }
        if ($image) {
            $data['image'] = asset($image);
        } else {
            $data['image'] = asset($this->_getSetting('site_logo'));
        }
        view()->share([
            'metaSEO' => $data,
        ]);
    }
}
