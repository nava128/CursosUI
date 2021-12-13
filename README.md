# Flutter Prático: criando um aplicativo do zero
## App desenvolvida no curso da Digital Innovation One

Projeto da Digital Innovation One, utiliza estrutura modular com o uso de Slidy, banco de dados sqlite para cadastrar os dados e alguns testes.

Agradecimentos a comunidade do discord da Academia do Flutter e o instrutor Rodrigo Rahman, para atualização com null safety.

<img src="https://github.com/gisesma/flutterCursosApp/blob/main/telasapp.png" width="70%" height="70%" alt="Tela de inicio do bmi calculator">


## Estrutura

```lib
|   main.dart
|   
\---app
    |   app_module.dart
    |   app_widget.dart
    |   
    +---domain
    |       atividade_model.dart
    |       atividade_model.g.dart
    |       curso_model.dart
    |       curso_model.g.dart
    |       
    +---modules
    |   +---atividade
    |   |       atividade_form.dart
    |   |       atividade_module.dart
    |   |       atividade_page.dart
    |   |       atividade_store.dart
    |   |       atividade_store.g.dart
    |   |       dialog_atividade.dart
    |   |       listagem_atividade.dart
    |   |       progress_circle.dart
    |   |       
    |   +---curso
    |   |       curso_form.dart
    |   |       curso_module.dart
    |   |       curso_page.dart
    |   |       curso_store.dart
    |   |       curso_store.g.dart
    |   |       
    |   \---home
    |           home_module.dart
    |           home_page.dart
    |           home_store.dart
    |           home_store.g.dart
    |           listagem_curso.dart
    |           progress_list_bar.dart
    |           web_view_curso.dart
    |           
    +---repositories
    |   |   atividade_repository.dart
    |   |   constants.dart
    |   |   curso_repository.dart
    |   |   
    |   \---interfaces
    |           atividade_repository_interface.dart
    |           curso_repository_interface.dart
    |           
    \---shared
        \---widgets
                background_box_decoration.dart
                logo_widget.dart
```

Para utilizar o flutter é necessário instalar o Dart SDK versão mínima 2.12

Para instalar, maiores instruções no link [Dart SDK](https://www.dartlang.org/downloads/):

- Mac: `brew tap dart-lang/dart && brew install dart`, ou então
  utilizar homebrew,  [latest stable channel build](https://www.dartlang.org/downloads/archive/)
- Linux: no link [www.dartlang.org/downloads/linux.html](https://www.dartlang.org/downloads/linux.html)
- Windows: instruções também na página oficial ou pode ser instalado utilizando chocolatey, comandos de linha de comando no Windows.

https://community.chocolatey.org/packages/dart-sdk/2.12.0

## Instalação do Flutter

https://flutter.dev/docs/get-started/install


Pode se utilizar tanto o Android Studio ou VScode

https://flutter.dev/docs/development/tools/android-studio

https://flutter.dev/docs/development/tools/vs-code

Clonando o repositório:

```
$ git clone https://github.com/gisesma/flutterCursosApp
```

Baixar as dependências do projeto:

```
$ flutter pub get
```

Para rodar o app, digitar o comando na linha de comando, dentro do diretório raiz do app:

```
$ flutter run
```


Última versão dos plugins em 09/2021, quando esse app foi gerado.
