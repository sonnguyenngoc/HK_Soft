function update_layout() {
    if ($(window).width() > 767) {
        undo_arrange_mobile_layout();
    } else {
        arrange_mobile_layout();
    }
}
function arrange_mobile_layout() {
    //Home page
    $(".home_top_categories").insertAfter( $('.home_main') );
    $(".home_infoblocks").insertAfter( $('.home_main') );

    // Other page
    $("main").insertBefore( $('aside') );
}
function undo_arrange_mobile_layout() {
    // Home page
    $(".home_infoblocks").insertBefore( $('.home_main') );
    $(".home_top_categories").insertBefore( $('.home_main_slider') );

    // Other page
    $("aside").insertBefore( $('main') );
}



$(document).ready(function () {

    // events when changing anything in filter box
    $(".v_centered .sort_select select").change(function() {
        $(this).parents("form").submit();
    });

    // events when changing anything in filter box
    $(".v_centered .show_select select").change(function() {
        $(this).parents("form").submit();
    });

    // update website layout
    update_layout();
    $('aside').show();

    // customtab
    $(document).on('click', '.customtab ul.customtab-head li a', function() {
        var tab = $(this).attr('href');
        var li = $(this).parents('li');

        li.parent().find('li').removeClass('active');
        li.addClass('active');

        $(this).parents('.customtab').find('.customtab-content').removeClass('active');
        $('[rel=' + tab + ']').addClass('active');
    });

    //// Register form
    //$(document).on('submit', '#new_user', function(e) {
    //    e.preventDefault();
    //
    //    var form = $(this);
    //    var method = form.attr('method');
    //    var url = form.attr('action');
    //
    //    if (form.valid()) {
    //        $.ajax({
    //            url: url,
    //            method: method,
    //            data: form.serialize()
    //        }).done(function( data ) {
    //            if($('<div>').html( data ).find( '#error_explanation' ).length) {
    //                alert('Email đã có người sử dụng. Vui lòng chọn emai khác.');
    //            } else {
    //                window.location = '/tai-khoan/tai-khoan-cua-toi';
    //            }
    //        });
    //    }
    //});
});

// update website layout
update_layout();
$( window ).resize(function () {
    update_layout();
});
