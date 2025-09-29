// ~/.eslint.config.cjs
module.exports = [
  {
    files: ['**/*.js'],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: 'module',
      globals: {
        // Браузерные глобальные
        window: 'readonly',
        document: 'readonly',
        navigator: 'readonly',
        location: 'readonly',
        console: 'readonly',
        setTimeout: 'readonly',
        setInterval: 'readonly',
        clearTimeout: 'readonly',
        clearInterval: 'readonly',
        alert: 'readonly',
        confirm: 'readonly',
        prompt: 'readonly',

        // jQuery
        $: 'readonly',
        jQuery: 'readonly',

        _: 'readonly',
        angular: 'readonly',
      },
    },
    rules: {
      // Стиль скобок — Allman
      'brace-style': ['error', 'allman'],

      // Пробелы внутри { } и [ ]
      'object-curly-spacing': ['error', 'always'],
      'array-bracket-spacing': ['error', 'always'],

      // Отступы и пунктуация
      'indent': ['error', 2],
      'semi': ['error', 'always'],
      'quotes': ['error', 'single'],

      // ✅ Замена let → const, где возможно
      'prefer-const': 'error'
    }
  }
];
