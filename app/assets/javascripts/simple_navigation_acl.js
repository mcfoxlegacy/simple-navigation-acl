$(document).on('change','.acl_tree_checkbox', function(ev) {
    var checkbox = $(this);

    if (checkbox.prop('checked')==true) {
        var acl_tree_parents = checkbox.parents('.acl_tree_item');
        acl_tree_parents.find('> :checkbox').prop('checked', true);
    } else {
        var acl_tree_item = checkbox.parent('.acl_tree_item:first');
        console.log(acl_tree_item);
        acl_tree_item.find(':checkbox').prop('checked', false);
    }

});
