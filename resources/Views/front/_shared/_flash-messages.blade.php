<?php
$errors = Session::get('errorMessages');
$messages = Session::get('successMessages');
$infos = Session::get('infoMessages');
$warnings = Session::get('warningMessages');
?>
@if($errors || $messages || $infos || $warnings)
<script>
@if($errors)
@foreach($errors as $key => $row)
alertify.error('{{ $row }}')
@endforeach
@endif
@if($messages)
@foreach($messages as $key => $row)
alertify.success('{{ $row }}')
@endforeach
@endif
@if($infos)
@foreach($infos as $key => $row)
alertify.success('{{ $row }}')
@endforeach
@endif
@if($warnings)
@foreach($warnings as $key => $row)
alertify.warning('{{ $row }}')
@endforeach
@endif
</script>
@endif