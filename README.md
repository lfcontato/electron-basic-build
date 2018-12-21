## electron-basic-build

- `package.json` - Aponta para o arquivo principal do aplicativo e lista seus detalhes e dependências..
- `main.js` - Processa o aplicativo e cria uma janela do navegador para renderizar HTML. Este é o processo principal **main process**
- `index.html` - Uma página da web para renderizar. Este é o aplicativo **renderer process**.

## Utilização

Para clonar e executar este repositório, você precisará do [Git](https://git-scm.com) e do [Node.js](https://nodejs.org/en/download/) (que vem com [npm](http://npmjs.com)) instalado no seu computador. Na sua linha de comando digite:


```bash
# Clone este repositório
git clone https://github.com/lfcontato/electron-basic-build.git
# Vá para o repositório
cd electron-basic-build
# Instalar dependências
npm install
# Execute o aplicativo
npm start
```

## Criando um instalador com electron-builder
Para criar o nosso instalador, vamos fazer uso de uma biblioteca disponível através de pacotes npm chamado Electron Builder, localize-se dentro da pasta onde está localizada nossa aplicação, eu instalei no construtor do electron: 

Na sua linha de comando digite:
```bash
npm install electron-builder --save-dev
```

[Diferença entre salvar um componente como "dependencies" ou "devDependencies"](DEPENDENCIES.md)

Nós vamos para a nossa pasta principal e criamos uma pasta chamada **build** onde vamos adicionar uma imagem para cada sistema operacional

- `build/icon.ico` - Necessário para o windows, **deve conter no mínimo a dimensão de 256x256 pixels**.
- `build/background.png` - Necessário para Mac.
- `build/icon.icns` - Necessário para Mac.

Faça as modificações nas chaves **"description"**, **"main"**, **"scripts"** : {"start","pack" e "dist"}, **"author"** e **"license"** do arquivo **package.json** como no exemplo.

Exemplo package.json:

```bash
  "description": "Aplicação básica em Electron Builder",

  "main": "main.js",
  "scripts": {
    "start": "electron .",
    "pack": "build --dir",
    "dist": "build"
  },

  "author": "@lfcontato",
  "license": "MIT",

```

Adicionaremos a chave **"build"**, na qual especificamos as informações necessárias para gerar o **executável instalavel** de cada sistema operacional. Após inserimos em nosso projeto a biblioteca externa: [**jquery**](https://www.npmjs.com/package/jquery), para que nosso instalador adicione esta bibliotecas lembre-se de tê-las em "dependencies". As bibliotecas como [**electron-builder**](https://www.npmjs.com/package/electron-builder) que estamos usando para criar o instalador, que não é necessária para a execução do programa e sim somente em fase de desenvolvimento, devem estar na chave "devDependencies" ou simplesmente remover no arquivo **package.json**.

Arquivo package.json:

```bash
  
  "build": {
    "appId": "electron-basic-builder",
    "asar": true,
    "dmg": {
      "contents": [
        {
          "x": 110,
          "y": 150
        },
        {
          "x": 240,
          "y": 150,
          "type": "link",
          "path": "/Applications"
        }
      ]
    },
    "linux": {
      "target": [
        "AppImage",
        "deb"
      ]
    },
    "win": {
      "target": "nsis",
      "icon": "build/icon.ico"
    },
      "nsis": {
        "menuCategory": true,
        "oneClick": false,
        "perMachine": true,
        "installerHeaderIcon": "build/icon.ico",
        "allowToChangeInstallationDirectory": true,
        "runAfterFinish": false
        }    
    },    
  },

```

## Adicionar essas bibliotecas:

Na sua linha de comando digite:

```bash
npm install jquery --save
```

## Gerando executável:

Isso seria praticamente tudo! só precisamos executar o comando para gerar nosso instalador. Uma pasta dist será criada automaticamente com o instalador e a pasta associada ao instalador. Como estou fazendo o teste no Windows, **somente o executável (instalador) do windows será criado**. será preciso executar o comando em cada sistema operacional onde será utilizado.

Na sua linha de comando digite:

```bash
npm run dist
```

## Conclusão:
Após a conclusão do comando **npm run dist** o arquivo executável (electron-basic-builder Setup 1.0.0.exe) é criado na pasta **dist** este arquivo que contém a instalação do programa e poderá ser distribuido entre os usuários. O programa é registrado no **Painel de Controle de Programas** (para eventual remoção) e criará os ícones do **Menu Iniciar** e da **Área de trabalho** que facilitam o acesso ao programa.

## Mais informações:

Acesse o link do [electron-builder](https://www.npmjs.com/package/electron-builder)


## License

[MIT (Public Domain)](LICENSE.md)