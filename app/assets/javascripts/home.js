  function display_equipment_detail(item) {
    $('.equipment_id_hidden').val(item.value);
    $.get('/sale_histories/equipment_detail', { id: item.value }, function (data) {
        $('span.brand_name').text(data.bname);
        $('span.model_name').text(data.mname);
    });
  }
  function set_hidden_id(item) {
    $('.customer_id_hidden').val(item.value);
  }

  $(document).ready(function(){
  	  $('.typeahead_equipment').typeahead({
          ajax: '/sale_histories/equipment_list_by_srno',
          displayField: 'serial_number',
          valueField: 'id',
          onSelect: display_equipment_detail
      });
      $('.typeahead_customer').typeahead({
          ajax: '/sale_histories/retailer_list_by_srno',
          displayField: 'usr_name',
          valueField: 'id',
          onSelect: set_hidden_id
      });
  });