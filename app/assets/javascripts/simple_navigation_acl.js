$(document).on('change','.acl_tree_checkbox', function(ev) {
    var checkbox = $(this);
    if (checkbox.prop('checked')==true) {
        var acl_tree_parents = checkbox.parents('.acl_tree_item');
        acl_tree_parents.find('> :checkbox').prop('checked', true);

        var acl_tree_children = checkbox.parent('.acl_tree_item:first').find('.acl_tree_item');
        acl_tree_children.find('> :checkbox').prop('checked', true);
    } else {
        var acl_tree_item = checkbox.parent('.acl_tree_item:first');
        acl_tree_item.find(':checkbox').prop('checked', false);
        // REMOVER O PRIMEIRO PAI QUANDO OS FILHOS ESTIVERM TODOS DESMARCADOS
        // var acl_tree_parent = acl_tree_item.parents('.acl_tree_item:first');
        // if (acl_tree_parent.find('.acl_tree_item > :checkbox:checked').length==0) {
        //     acl_tree_parent.find(':checkbox:first').prop('checked', false);
        // }
    }
});