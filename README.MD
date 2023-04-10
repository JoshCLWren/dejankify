DEJANKIFY -- remove the jank from your code

This is a tool that helps you maintain your python environment by removing unnecessary dependencies.
By default, it will remove all packages that are not explicitly imported in your code.
It will also remove any import statements that are for packages that are not referenced in your code.
It also creates a requirements.txt file that contains all the packages that are explicitly imported in your code
and are not part of the standard library and are pip installable.