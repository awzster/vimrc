var OFF = 0, WARN = 1, ERROR = 2;

module.exports = exports = {
  "env": { "es6": true },

  //"env" : { "es6": true, "node" :true },
  /* 
  "ecmaFeatures": {
    "modules": true
  }, 
  */
  "globals": {
    "angular": 'readonly',
    "window": 'readonly',
    "document": 'readonly',
    "alert": 'readonly',
    "console": 'readonly',
    "$": 'readonly',
    "Highcharts": 'readonly',
    "swal": 'readonly',
    "date2str": 'readonly',
    "_": 'readonly',
    "moment": 'readonly',
    "agGrid": 'readonly',
    "gridStateToolPanel": 'readonly',
  },
  "extends": [
    "eslint:recommended" 
    //"plugin:jquery/slim", 
    //"plugin:lodash/recommended"
  ],
  "plugins": [
    //"prefer-arrow",
    //"jquery",
    //"promise",
    //"no-loops",
    //"optimize-regex"
    //"lodash"
  ],

  "rules": {

    /* 
    "prefer-arrow/prefer-arrow-functions": [
      "error",
      {
        "disallowPrototype": true,
        "singleReturnOnly": false,
        "classPropertiesAllowed": false
      }
    ],
    "prefer-arrow-callback": [
      "error",
      { "allowNamedFunctions": true }
    ], 
    */
    "func-style": [
      "error",
      "expression",
      { "allowArrowFunctions": true }
    ],
    /* 
    "no-restricted-syntax": [
      "error",
      "FunctionExpression",
      "FunctionDeclaration"
    ], 
    */

    "no-extra-parens": ERROR,
    "no-unexpected-multiline": ERROR,
    // All JSDoc comments must be valid
    "valid-jsdoc": [ ERROR, {
      "requireReturn": false,
      "requireReturnDescription": false,
      "requireParamDescription": true,
      "prefer": {
        "return": "returns"
      }
    }],

    // Best Practices

    // Allowed a getter without setter, but all setters require getters
    "accessor-pairs": [ ERROR, {
      "getWithoutSet": false,
      "setWithoutGet": true
    }],
    "block-scoped-var": WARN,
    "consistent-return": ERROR,
    //"curly": ERROR,
    "default-case": WARN,
    // the dot goes with the property when doing multiline
    "dot-location": [ WARN, "property" ],
    "dot-notation": WARN,
    //"eqeqeq": [ ERROR, "smart" ],
    "guard-for-in": WARN,
    "no-alert": ERROR,
    "no-caller": ERROR,
    "no-case-declarations": WARN,
    "no-div-regex": WARN,
    "no-else-return": WARN,
    //"no-empty-label": WARN,
    "no-empty-pattern": WARN,
    "no-eq-null": WARN,
    "no-eval": ERROR,
    "no-extend-native": ERROR,
    "no-extra-bind": WARN,
    "no-floating-decimal": WARN,
    "no-implicit-coercion": [ WARN, {
      "boolean": true,
      "number": true,
      "string": true
    }],
    "no-implied-eval": ERROR,
    //"no-invalid-this": ERROR,
    "no-iterator": ERROR,
    "no-labels": WARN,
    "no-lone-blocks": WARN,
    "no-loop-func": ERROR,
    //"no-magic-numbers": WARN,
    "no-multi-spaces": ERROR,
    "no-multi-str": WARN,
    "no-native-reassign": ERROR,
    "no-new-func": ERROR,
    "no-new-wrappers": ERROR,
    "no-new": ERROR,
    "no-octal-escape": ERROR,
    "no-param-reassign": ERROR,
    "no-process-env": WARN,
    "no-proto": ERROR,
    "no-redeclare": ERROR,
    "no-return-assign": ERROR,
    "no-script-url": ERROR,
    "no-self-compare": ERROR,
    "no-throw-literal": ERROR,
    "no-unused-expressions": ERROR,
    "no-useless-call": ERROR,
    "no-useless-concat": ERROR,
    "no-void": WARN,
    // Produce warnings when something is commented as TODO or FIXME
    "no-warning-comments": [ WARN, {
      "terms": [ "TODO", "FIXME" ],
      "location": "start"
    }],
    "no-with": WARN,
    "radix": WARN,
    "vars-on-top": ERROR,
    // Enforces the style of wrapped functions
    "wrap-iife": [ ERROR, "outside" ],
    "yoda": ERROR,

    // Strict Mode - for ES6, never use strict.
    //"strict": [ ERROR, "never" ],

    // Variables
    "init-declarations": [ ERROR, "always" ],
    "no-catch-shadow": WARN,
    "no-delete-var": ERROR,
    "no-label-var": ERROR,
    "no-shadow-restricted-names": ERROR,
    "no-shadow": WARN,
    // We require all vars to be initialized (see init-declarations)
    // If we NEED a var to be initialized to undefined, it needs to be explicit
    "no-undef-init": OFF,
    "no-undef": ERROR,
    "no-undefined": OFF,
    "no-unused-vars": WARN,
    // Disallow hoisting - let & const don't allow hoisting anyhow
    "no-use-before-define": ERROR,

    // Node.js and CommonJS
    "callback-return": [ WARN, [ "callback", "next" ]],
    "global-require": ERROR,
    "handle-callback-err": WARN,
    "no-mixed-requires": WARN,
    "no-new-require": ERROR,
    // Use path.concat instead
    "no-path-concat": ERROR,
    "no-process-exit": ERROR,
    "no-restricted-modules": OFF,
    "no-sync": WARN,

    // ECMAScript 6 support
    //"arrow-body-style": [ ERROR, "always" ],
    //"arrow-parens": [ ERROR, "always" ],
    "arrow-spacing": [ ERROR, { "before": true, "after": true }],
    "constructor-super": ERROR,
    "generator-star-spacing": [ ERROR, "before" ],
    //"no-arrow-condition": ERROR,
    "no-class-assign": ERROR,
    "no-const-assign": ERROR,
    "no-dupe-class-members": ERROR,
    "no-this-before-super": ERROR,
    "no-var": WARN,
    "object-shorthand": [ WARN, "never" ],
    "prefer-arrow-callback": WARN,
    "prefer-spread": WARN,
    "prefer-template": WARN,
    "require-yield": ERROR,

    // Stylistic - everything here is a warning because of style.
    "array-bracket-spacing": [ WARN, "always" ],
    "block-spacing": [ WARN, "always" ],
    //"brace-style": [ WARN, "allman", { "allowSingleLine": false } ],
    //"brace-style": [ WARN, "stroustrup", { "allowSingleLine": false } ],
    //"brace-style": [ WARN, "1tbs", { "allowSingleLine": false } ],
    //"camelcase": WARN,
    "comma-spacing": [ WARN, { "before": false, "after": true } ],
    "comma-style": [ WARN, "last" ],
    "computed-property-spacing": [ WARN, "never" ],
    "consistent-this": [ WARN, "self" ],
    "eol-last": WARN,
    //"func-names": WARN,
    "func-style": [ WARN, "declaration" ],
    "id-length": [ WARN, { "min": 2, "max": 32 } ],
    "indent": [ WARN, 2 ],
    "jsx-quotes": [ WARN, "prefer-double" ],
    //"linebreak-style": [ WARN, "unix" ],
    //"lines-around-comment": [ WARN, { "beforeBlockComment": false } ],
    "max-depth": [ WARN, 8 ],
    "max-len": [ WARN, 142 ],
    "max-nested-callbacks": [ WARN, 8 ],
    "max-params": [ WARN, 16 ],
    "new-cap": WARN,
    "new-parens": WARN,
    "no-array-constructor": WARN,
    "no-bitwise": OFF,
    "no-continue": OFF,
    "no-inline-comments": OFF,
    "no-lonely-if": WARN,
    //"no-mixed-spaces-and-tabs": WARN,
    //"no-multiple-empty-lines": WARN,
    "no-negated-condition": OFF,
    "no-nested-ternary": WARN,
    "no-new-object": WARN,
    "no-plusplus": OFF,
    "no-spaced-func": WARN,
    "no-ternary": OFF,
    "no-trailing-spaces": WARN,
    "no-underscore-dangle": WARN,
    "no-unneeded-ternary": WARN,
    "object-curly-spacing": [ WARN, "always" ],
    "one-var": OFF,
    "operator-assignment": [ WARN, "always" ],
    "operator-linebreak": [ WARN, "after" ],
    "padded-blocks": [ WARN, "never" ],
    "quote-props": [ WARN, "consistent-as-needed" ],
    "quotes": [ WARN, "single" ],
    /*
    "require-jsdoc": [ WARN, {
      "require": {
        "FunctionDeclaration": true,
        "MethodDefinition": true,
        "ClassDeclaration": false
      }
    }],
    */
    "semi-spacing": [ WARN, { "before": false, "after": true }],
    "semi": [ ERROR, "always" ],
    "sort-vars": OFF,
    //"keyword-spacing": [ WARN, "always" ],
    "space-before-blocks": [ WARN, "always" ],
    "space-before-function-paren": [ WARN, "never" ],
    //"space-before-keywords": [ WARN, "always" ],
    "space-in-parens": [ WARN, "never" ],
    "space-infix-ops": [ WARN, { "int32Hint": true } ],
    //"space-return-throw-case": ERROR,
    "space-unary-ops": ERROR,
    //"spaced-comment": [ WARN, "always" ],
    "wrap-regex": WARN

  }
};
