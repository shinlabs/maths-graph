# Maths Web Components

This project contains different components for Mathematics purpose (such as graph component, algorithms-programming component, vector component). Each components can be built as Web Components, in order to reuse them in any application's frontend (see below for How-to).  

If needs arise, and if technically possible, [Giac](https://www-fourier.ujf-grenoble.fr/~parisse/giac_us.html) will be integrated, using Web Assembly.  

## How to build

The component App is a homepage that contains all Components, with a presentation for each, and a link for building a .zip archive. Otherwise, you can use the built-in vue-cli-service for building. For example, when at the root folder of the project : `npx vue-cli-service build --target wc --inline-vue --name my-custom-component './src/components/NameOfComponent.vue'`.  
Be aware that variables in vue project use camelCase, while you should use kebab-case when using these variables in Web components (e.g in `.vue` files you'll find `functionType`, and you should use it like `<my-custom-component function-type="discreet"></my-custom-component>`)

## Components

### Graph component
Its purpose is to render a function graph given the function algebraic expression.   
It uses [vue-chartjs](https://github.com/apertureless/vue-chartjs/) which integrates the library [Chart.js](https://github.com/chartjs/Chart.js).  
