document.addEventListener("turbolinks:load", function(){
	$input = $("[data-behavior='autocomplete']")
	var itemList = [];
	var options = {
		getValue: 'name',
		url: function(phase) {
			return '/search.json?q='+ phase;
		},
		categories: [
			{
				listLocation: "items"
			}
		],
		list: {
			onChooseEvent: function(){
				var name = $input.getSelectedItemData().name
				var id = $input.getSelectedItemData().id
				var price = $input.getSelectedItemData().price
				$input.val("")


				$(function() {
						if(itemList.indexOf(id) < 0) {
							$("tbody#items").append('<tr> <td> <button id="remove-' + id + '" type="button" class="btn border-warning text-warning-600 btn-flat btn-icon btn-xs remove_item"> Remove Item </button> </td><td><input type="hidden" name="bill[bills_items_attributes][][item_id]" value="' + id +'" /> <span id="' + id + '" class="form-control">' + name + '</span> </td><td id="price-'+ id +'">' + price + '</td><td> <input class="quantity-input" id="quantity-'+ id +'" name="bill[bills_items_attributes][][quantity]"  class="form-control" placeholder="Enter Quantity" required> </td></tr>')
					    itemList.push(id)
						}
        });
			}
		}
	}
	$input.easyAutocomplete(options)
	
	$("body").on("click", ".remove_item", function() {
		var id = $(this).closest("tr > td > button").attr('id').split("-")[1];
		var index = itemList.indexOf(parseInt(id));
		if (index > -1) {
			itemList.splice(index, 1);
		}
		$(this).closest("tr").remove();
		countTotal();
  });

  $("body").on("keyup", ".quantity-input", function() {
  	var id = $(this).attr('id').split("-")[1];
  	var value = $(this).val();
  	var price = parseInt($("#price-" + id).html());
  	countTotal();
  });

  function countTotal() {
		var totalAmount = 0;
		$(".quantity-input").each(function(){
			var id = parseInt($(this).attr('id').split("-")[1]);
			totalAmount += ($(this).val() ? parseInt($(this).val()) : 0) * parseInt($("#price-" + id).html());
		});
		totalAmount += ((totalAmount / 100)*15);
		$("#bill_total_amount").val(totalAmount)
  }
});