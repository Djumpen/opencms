<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h1 class="panel-title"><i class="fa fa-bar-chart-o"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form class="form-horizontal">
        <div class="well">
          <div class="row">
            <div class="col-xs-5">
              <div class="form-group">
                <label class="col-xs-2 control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="col-xs-10">
                  <input name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="input-date-start" class="form-control datepicker" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="col-xs-10">
                  <input name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="input-date-end" class="form-control datepicker" />
                </div>
              </div>
            </div>
            <div class="col-xs-5">
              <div class="form-group">
                <label class="col-xs-2 control-label" for="input-group"><?php echo $entry_group; ?></label>
                <div class="col-xs-10">
                  <select name="filter_group" id="input-group" class="form-control">
                    <?php foreach ($groups as $group) { ?>
                    <?php if ($group['value'] == $filter_group) { ?>
                    <option value="<?php echo $group['value']; ?>" selected="selected"><?php echo $group['text']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $group['value']; ?>"><?php echo $group['text']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-xs-10">
                  <select name="filter_order_status_id" class="form-control">
                    <option value="0"><?php echo $text_all_status; ?></option>
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-xs-2">
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
      </form>
      <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_date_start; ?></td>
              <td class="text-left"><?php echo $column_date_end; ?></td>
              <td class="text-left"><?php echo $column_title; ?></td>
              <td class="text-right"><?php echo $column_orders; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($orders) { ?>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="text-left"><?php echo $order['date_start']; ?></td>
              <td class="text-left"><?php echo $order['date_end']; ?></td>
              <td class="text-left"><?php echo $order['title']; ?></td>
              <td class="text-right"><?php echo $order['orders']; ?></td>
              <td class="text-right"><?php echo $order['total']; ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="row">
        <div class="col-xs-6 text-left"><?php 
if ($pagination){
$str = $pagination;

$str1 = str_replace('<div class="links">', '<ul class="pagination">', $str);
$str2 = str_replace('</div>', '</ul>', $str1);
$str3 = str_replace('<a', '<li><a', $str2);
$str4 = str_replace('</a>', '</a></li>', $str3);
$str5 = str_replace('<b>', '<li class="active"><a>', $str4);
$str6 = str_replace('</b>', '<span class="sr-only">(current)</span></a></li>', $str5);
$str7 = str_replace('&gt;|', '<i class="fa fa-angle-double-right"></i>', $str6);
$str8 = str_replace('&gt;', '<i class="fa fa-angle-right"></i>', $str7);
$str9 = str_replace('|&lt;', '<i class="fa fa-angle-double-left"></i>', $str8);
$str10 = str_replace('&lt;', '<i class="fa fa-angle-left"></i>', $str9);
$str11 = str_replace('....', '<li class="disabled"><span>....</span></li>', $str10);
echo $str11; 
}
?></div>

      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=report/sale_shipping&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
		
	var filter_group = $('select[name=\'filter_group\']').val();
	
	if (filter_group) {
		url += '&filter_group=' + encodeURIComponent(filter_group);
	}
	
	var filter_order_status_id = $('select[name=\'filter_order_status_id\']').val();
	
	if (filter_order_status_id != 0) {
		url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
	}	

	location = url;
});
//--></script> 
<?php echo $footer; ?>