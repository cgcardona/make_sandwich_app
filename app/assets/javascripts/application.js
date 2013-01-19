// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
'use strict';
window.onload = function()
{
  var MakeSandwich = {
    init : function()
    {
      this.sandwichType = 'meat';
      this.ingredients  = [];
      this.attachEventListeners();
      this.updateOrderOutput();
    },
    updateOrderOutput : function()
    {
      var formValues = this.getFormValues();
      $('#currentOrderContainer #type span').text(this.capitalize(formValues.sandwichType));
      var context = this;
      $('#currentOrderContainer #ingredients span').text(function(){
        var returnStr = '';
        _.each(context.ingredients, function(element, index, list){
          returnStr += element + ', ';
        }, context);
        return returnStr;
      });
    },
    getFormValues : function()
    {
      return {
        sandwichType : this.sandwichType,
        ingredients  : this.ingredients
      };
    },
    setFormValues : function()
    {
    },
    attachEventListeners : function()
    {
      var context = this;
      $('#sandwichType').change(function(e){
        var types = ['meat', 'veggie', 'vegan'];
        context.sandwichType = e.currentTarget.value;

        var filteredTypes = _.filter(types, function(num){
          $('#' + e.currentTarget.value + 'Ingredients').show();
          if(num != e.currentTarget.value)
            return num;
        }) 

        _.each(filteredTypes, function(element, index, list){
          $('#' + element + 'Ingredients').hide();
        });

        $('input[type="checkbox"]').attr('checked', false);
        context.ingredients = [];
        context.updateOrderOutput();
      });
      $('#orderFormContainer input[type="checkbox"]').change(function(e){
        if(e.currentTarget.checked === true)
          context.ingredients.push(e.currentTarget.value);
        else if(e.currentTarget.checked === false)
          context.ingredients.pop(e.currentTarget.value);

        context.updateOrderOutput();
      });
    },
    capitalize : function(str)
    {
      return str.charAt(0).toUpperCase() + str.slice(1);
    }
  };
  MakeSandwich.init();
}
