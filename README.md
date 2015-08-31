

# Formal Affair

## Instructions

Three resources have been set up and each needs their own set of forms.

Run the tests and look in the "app/views" directory for where the forms
will live.

1. Babies
  - Use the form_for helper.

2. Concretes
  - Use the form_tag helper.

3. Searches
  - Use the HTML \<form\> tag.

Here's the [Rails Form Helper Guide](http://guides.rubyonrails.org/form_helpers.html).

Rails uses CSRF tokens in its forms
to defend against the [cross site request forgery
vulnerability] (http://guides.rubyonrails.org/security.html#csrf-countermeasures).

When you're not using a Rails form helper, you'll need to insert your
own CSRF token.
[Here's](http://news-anand.blogspot.com/2013/05/include-csrf-token-in-form-ruby-on-rails.html)
an example of how to do so.

## Deliverables

Fork this repository and deliver your solution in master.

## Resources
* [Rails Guides](http://guides.rubyonrails.org/) - [Form Helpers](http://guides.rubyonrails.org/form_helpers.html)
* [Rails Guides](http://guides.rubyonrails.org/security.html) - [Security: CSRF Countermeasures](http://guides.rubyonrails.org/security.html#csrf-countermeasures)
* [Stack Overflow](http://stackoverflow.com/questions/4085136/how-to-generate-authenticitytoken-on-rails) - [Include CSRF Token in Form](http://stackoverflow.com/a/4085156)
