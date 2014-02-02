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
//= require tinymce-jquery
//= require_tree .

$(function(){
    $( "#dialog:ui-dialog" ).dialog( "destroy" );
    $("#flash_notice").fadeOut(4000);
    $(document).on("click", "#close_button", function(){
        $("#flash_notice").fadeOut(500);
    });
    
    $(document).on("click",'.backtotop',function(){
        $('html, body').animate({
            scrollTop:0
        }, 'slow');
    });
 
 
    $( ".jquery-ui-button" )
    .button()
    .click(function() {
        location.href= $(this).attr("href")
    });
    
    tinyMCE.init({
        selector: "textarea.tinymce",
        theme: 'advanced'
    });
    $('#gallery a').lightBox();
    
    $('li', '#tag-cloud').each(function() {

        var $li = $(this);
        var $a = $('a', $li);
        var fontSize = parseInt($a.css('fontSize'));

        $a.hover(function() {
    
            $a.stop(true, true).animate({
                fontSize: fontSize + 4 + 'px'
            }, 'slow', 'easeOutBounce');
    
    
        }, function() {
    
            $a.stop(true, true).animate({
                fontSize: fontSize + 'px'
            }, 'slow', 'easeOutBounce');
    
    
        });    
  
    });
    
    $(document).on("click","#getDistance", function(){
        $("#distanceValue").html("Loading...");
        $.ajax({
            url : $( this ).attr( 'action' ),
            data : {
                source: $("#source_location").val()
            },
            success : function(results){
                $('#distanceValue').html(results);                    
            },
            error : function(request, status, error){
                alert("Sorry!! An error occured while processing your request. Please try again later")
                $('#distanceValue').html("");
            }
        });
        return false;
    })
 
    $('#test').gmap3();

    $('#source_location').autocomplete({
        source: function() {
            $("#test").gmap3({
                action:'getAddress',
                address: $(this).val(),
                callback:function(results){
                    if (!results) return;
                    $('#source_location').autocomplete(
                        'display', 
                        results,
                        false
                        );
                }
            });
        },
        cb:{
            cast: function(item){
                return item.formatted_address;
            },
            select: function(item) {
                $("#test").gmap3(
                {
                    action:'clear', 
                    name:'marker'
                },

                {
                    action:'addMarker',
                    latLng:item.geometry.location,
                    map:{
                        center:true
                    }
                }
                );
            }
        }
    })
})

