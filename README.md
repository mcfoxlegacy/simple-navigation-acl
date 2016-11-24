# Simple Navigation Acl 

A great and easy condition builder to your rails project

## How to install

Add it to your **Gemfile**: 
```ruby
gem 'simple-navigation-acl'
```

Run the following command to install it:
```sh
$ bundle install
$ rails generate simple_navigation_acl:install
$ rake db:migrate
```

Add it to your **app/assets/stylesheets/application.css**
```js
*= require simple_navigation_acl
```

Add it to your **app/assets/javascripts/application.js**
```js
//= require simple_navigation_acl
```

Modify simple-navigation helper `render_navigation` in your views to simple-navigation-acl helper `render_navigation_acl` and add param `acl_id`, like:
```haml
= render_navigation_acl acl_id: current_user.role
```

If you need to see all navigations like a Super Admin, pass `:all` to **acl_id**:
```haml
= render_navigation_acl acl_id: :all
```


## ID and CONTEXT

The simple-navigation-acl have id and [context](https://github.com/codeplant/simple-navigation/wiki/Configuration) to create rules for you:

Example for roles:

**config/navigation.rb**

```ruby
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :menu1, "Menu 1", root_path do |sub_nav|
      sub_nav.item :sub_menu1, 'Sub Menu1', root_path
    end
  end
end
```

**config/admin_navigation.rb**

```ruby
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :adm_menu1, "Admin Menu 1", root_path do |sub_nav|
      sub_nav.item :adm_sub_menu1, 'Admin Sub Menu1', root_path
    end
  end
end
```

**table acl_rules**

id | context | key
--- | --- | ---
admin | default | :menu1
admin | default | :sub_menu1
admin | admin | :adm_menu1
admin | admin | :adm_sub_menu1
user | default | :menu1
...

## Routes

**Edit Acl Rules**

You can bind acl rule on resource, doesn't matter what resource it is.
Only pass `id` to the route and it will be binded.

```ruby
@resource = User.first
# or
@resource = Role.last
# or
@resource = Wherever.find_by(id: 1)
```

```haml
= link_to 'Edit', simple_navigation_acl_edit_path(@resource)
= link_to 'Show', simple_navigation_acl_show_path(@resource)
```

Or a String like `@role = 'admin'` then:
```haml
= link_to 'Edit', simple_navigation_acl_edit_path(id: @role)
```

And to save via HTTP PATCH, PUT or POST, like:
```haml
= form_tag simple_navigation_acl_save_path(@resource), method: :put
    
```

### Editing default views

On install is created two views: **edit** and **show**

In `views/simple_navigation_acl/show.html.erb`:
```html
<% SimpleNavigationAcl::Base.contexts.each do |context| %>
    <%= render 'simple_navigation_acl/list', context: context, readonly: true %>
<% end %>
```
You can List all navigations contexts with `SimpleNavigationAcl::Base.contexts` and can render only permissions list with: `render 'simple_navigation_acl/list', context: context`
By default `context=:default` and `readonly=false` (readonly define if permissiosn list is editable or not) 


### Example Form for ACL by Roles

```haml
.row
  .col-md-12
    %table.table.table-hover{style: 'width: auto'}
      %tr
        %th Roles
        %th
      - [:admin, :user].each do |role|
        %tr
          %td= role
          %td
            = link_to 'Edit', simple_navigation_acl_edit_path(id: role)
            \|
            = link_to 'Edit', simple_navigation_acl_show_path(id: role)
```

```haml
= render_navigation_acl acl_id: current_user.role
```

### Example Form for ACL by User

```haml
.row
  .col-md-12
    %table.table.table-hover{style: 'width: auto'}
      %tr
        %th Roles
        %th
      - User.all.each do |user|
        %tr
          %td= role
          %td
            = link_to 'Edit', simple_navigation_acl_edit_path(user)
            \|
            = link_to 'Edit', simple_navigation_acl_show_path(user)
```

```haml
= render_navigation_acl acl_id: current_user.id
```

## Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as
possible to help us fixing the possible bug. We also encourage you to help even more by forking and
sending us a pull request.

https://github.com/brunoporto/simple_navigation_acl/issues

## Maintainers

* Bruno Porto (https://github.com/brunoporto)

## License

The MIT License (MIT)
Copyright (c) 2016 Bruno Porto

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.