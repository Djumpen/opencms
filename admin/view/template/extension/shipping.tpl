<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h1 class="panel-title"><i class="fa fa-puzzle-piece"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left hidden-xs width-10"><?php echo $column_status; ?></td>
              <td class="text-right hidden-xs width-10"><?php echo $column_sort_order; ?></td>
              <td class="text-right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($extensions) { ?>
            <?php foreach ($extensions as $extension) { ?>
            <tr>
              <td class="text-left"><?php echo $extension['name']; ?></td>
              <td class="text-left hidden-xs"><span<?php echo ($this->language->get('text_disabled') == $extension['status'])?' class="label label-warning"':' class="label label-primary"'; ?>><?php echo $extension['status'] ?></span></td>
              <td class="text-right hidden-xs"><?php echo $extension['sort_order']; ?></td>
              <td class="text-right"><div class="btn-group"><?php foreach ($extension['action'] as $action) { ?>
                <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $action['text']; ?>" class="btn <?php $text_uninstall = $this->language->get('text_uninstall'); if ( isset($text_uninstall) && $text_uninstall == $action['text'] ){ echo " btn-warning"; $icon="fa fa-times"; }else{ echo " btn-primary"; $icon = "fa fa-edit"; } ?>"><i class="<?php echo $icon; ?>"></i> <?php echo $action['text']; ?></a>
                <?php } ?></div></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>