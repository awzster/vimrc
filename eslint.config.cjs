// ~/.eslint.config.cjs
const globals = require('globals');

module.exports = [
  {
    files: ['**/*.js'],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: 'module',
      globals: {
        // Стандартные глобальные переменные
        ...globals.browser,
        ...globals.node,
        // Ваши AngularJS-зависимости
        angular: 'readonly',
        $: 'readonly',
        jQuery: 'readonly',
        moment: 'readonly',
        gridStateToolPanel: 'readonly',
        // Добавьте сюда другие глобальные переменные из ваших проектов при необходимости
      },
    },
    plugins: {
      // Подключаем плагин по имени — ESLint найдёт его в node_modules (включая глобальные)
      '@stylistic': '@stylistic/eslint-plugin-js',
    },
    rules: {
      // ========= Форматирование (стиль) — через @stylistic =========
      '@stylistic/brace-style': ['error', 'allman', { allowSingleLine: true }],
      '@stylistic/indent': ['error', 2],
      '@stylistic/semi': ['error', 'always'],
      '@stylistic/quotes': ['error', 'single'],

      // ========= Логические правила =========
      'no-undef': 'error',
      'no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
      'eqeqeq': ['error', 'always'],
      'no-var': 'error',
      'prefer-const': 'error',
      'no-console': 'warn',
      'no-debugger': 'error',
    },
  },
];
