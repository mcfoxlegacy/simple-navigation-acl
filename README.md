# Simple Navigation Acl 

A great and easy condition builder to your rails project

## How to install

Add it to your **Gemfile**: 
```ruby
gem 'simple_navigation_acl'
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

## Dependency


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

### Example

```haml
.row
  .col-md-12
    %table.table.table-hover{style: 'width: auto'}
      %tr
        %th Perfil
        %th
      - [:admin, :gestor, :superior, :analista].each do |role|
        %tr
          %td= role
          %td
            = link_to 'Editar', simple_navigation_acl_edit_path(id: role)
            \|
            = link_to 'Exibir', simple_navigation_acl_show_path(id: role)
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