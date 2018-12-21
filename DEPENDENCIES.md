## Diferença entre salvar um componente como "dependencies" ou "devDependencies"

- `dependencies` - Programas necessários para produção.
- `devDependencies` - Programas usados para desenvolvimento.

**dependencies** são todos os programas necessários para a aplicação funcionar. A aplicação depende deles e têm de estar instalados senão a aplicação não corre. Caso se queira instalar somente as dependencias de produção pode usar-se npm install --production.

**Para gravar uma dependencia como essencial:**

```bash
npm install nome-do-pacote --save
```

**devDependencies** são todos os programas necessários para ambiente de "dev", desenvolvimento, da aplicação. Pode ser de tudo desde compressores de código, transpiladores, testes unitários, ferramentas de debug, etc. Estes não são necessários para a aplicação funcionar, mas sim para desenvolver e /ou testar.

**Para gravar uma dependencia como "dev":**
```bash
npm install nome-do-pacote --save-dev
```