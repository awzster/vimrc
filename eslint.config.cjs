// ~/eslint.config.cjs
/* global module, require */
const globals = require('globals');
const stylistic = require('@stylistic/eslint-plugin');

module.exports = [
  {
    files: ['**/*.js'],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: 'module',
      globals: {
        ...globals.browser,
        ...globals.node,
        window: 'readonly',
        document: 'readonly',
        navigator: 'readonly',
        location: 'readonly',
        console: 'readonly',
        $: 'readonly',
        jQuery: 'readonly',
        angular: 'readonly',
        moment: 'readonly',
        _: 'readonly',
        gridStateToolPanel: 'readonly',
      },
    },
    plugins: {
      '@stylistic': stylistic,
    },
    rules: {
      // ========= Форматирование (через @stylistic) =========
      '@stylistic/brace-style': ['error', 'allman', { allowSingleLine: true }],
      '@stylistic/indent': ['error', 2],
      '@stylistic/semi': ['error', 'always'],
      '@stylistic/quotes': ['error', 'single'],
      '@stylistic/space-in-parens': ['error', 'never'],
      '@stylistic/array-bracket-spacing': ['error', 'always'],   // было 'never'
      '@stylistic/object-curly-spacing': ['error', 'always'],    // было 'never'
      '@stylistic/computed-property-spacing': ['error', 'always'],

      // ========= Стиль и логика =========
      'max-len': ['error', { code: 180 }],                       // было 160
      'prefer-const': 'error',
      'no-var': 'error',
      'no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
      'no-undef': 'error',
      'eqeqeq': ['error', 'always'],
      'no-console': 'warn',
      'no-debugger': 'error',
    },
  },
];

