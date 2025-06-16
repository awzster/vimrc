import eslintRecommended from "@eslint/js";
import stylistic from "@stylistic/eslint-plugin";

export default [
  eslintRecommended.configs.recommended,
  {
    plugins: {
      stylistic,
    },
    rules: {
      "quotes": ["error", "single", { "avoidEscape": true }],
      "stylistic/brace-style": ["error", "allman", { "allowSingleLine": true }],

      // Сравнения только по строгому равенству
      "eqeqeq": ["error", "always"],

      // Всегда использовать блоки для ветвлений и циклов
      //"curly": ["error", "multi-line"],

      // Запрет “мёртвого” кода (предупреждение, но лучше исправить сразу)
      "no-unused-vars": ["warn", { "args": "after-used", "ignoreRestSiblings": true }],

      // Не использовать var, только let/const
      "no-var": "error",

      // Предпочитать const, если значение не меняется
      "prefer-const": "error",

      // Запретить console.log в проде (можно “warn”, чтобы не ломало CI)
      "no-console": ["warn", { "allow": ["warn", "error"] }],

      // Запретить debugger
      "no-debugger": "error",

      // Управление отступами — 2 пробела (или 4, по вашему выбору)
      "stylistic/indent": ["error", 2, {
        "SwitchCase": 1,       // отступ для case внутри switch
        "VariableDeclarator": 1,
        "outerIIFEBody": 1,
        "FunctionDeclaration": { "parameters": 1, "body": 1 },
        "FunctionExpression": { "parameters": 1, "body": 1 },
        "CallExpression": { "arguments": 1 },
        "ArrayExpression": 1,
        "ObjectExpression": 1,
        "ImportDeclaration": 1,
        "flatTernaryExpressions": false,
        "ignoredNodes": ["TemplateLiteral *"],
        "ignoreComments": false
      }],
    },
    languageOptions: {
      ecmaVersion: 2020,
      sourceType: "module",
      globals: {
        angular:  "readonly",
        window:   "readonly",
        document: "readonly",
        $:        "readonly",
        _:        "readonly"
      }
    },
  },
];

