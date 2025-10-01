// ~/.eslint.config.cjs
const globals = require('globals');

module.exports = [
  {
    files: [ '**/*.js' ],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: 'module',
      globals: {
        // Стандартные глобальные переменные
        ...globals.browser,
        ...globals.node,

        // Дополнительные глобальные объекты (часто используемые в проектах)
        window: 'readonly',
        document: 'readonly',
        navigator: 'readonly',
        location: 'readonly',
        console: 'readonly',

        // jQuery
        $: 'readonly',
        jQuery: 'readonly',

        // AngularJS
        angular: 'readonly',

        // Moment.js
        moment: 'readonly',

        // Другие распространённые глобальные переменные
        _: 'readonly',
        gridStateToolPanel: 'readonly',
        // Добавьте сюда любые другие глобальные переменные из ваших проектов
      },
    },
    plugins: {
      '@stylistic': '@stylistic/eslint-plugin-js',
    },
    rules: {
      // ========= Форматирование (через @stylistic) =========
      '@stylistic/brace-style': [ 'error', 'allman', { allowSingleLine: true } ],
      '@stylistic/indent': [ 'error', 2 ],
      '@stylistic/semi': [ 'error', 'always' ],
      '@stylistic/quotes': [ 'error', 'single' ],

      // Пробелы внутри скобок: func(a, b), arr[i], {a: 1}
      //'@stylistic/space-in-parens': ['error', 'never'],
      '@stylistic/space-in-brackets': [ 'error', 'never' ],
      '@stylistic/space-in-braces': [ 'error', 'never' ],

      // ========= Стиль и логика =========
      'max-len': [ 'error', { code: 160 } ],
      'prefer-const': 'error',
      'no-var': 'error',
      'no-unused-vars': [ 'error', { argsIgnorePattern: '^_' } ],
      'no-undef': 'error',
      'eqeqeq': [ 'error', 'always' ],
      'no-console': 'warn',
      'no-debugger': 'error',
    },
  },
];
