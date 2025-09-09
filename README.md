# Projeto de Automação com Robot Framework

Bem-vindo ao projeto de automação de testes desenvolvido com Robot Framework! Este projeto inclui suporte para testes web (com SeleniumLibrary) e manipulação de planilhas Excel (com ExcelLibrary).

## Pré-requisitos

- Python 3.8 ou superior
- Git (opcional, para controle de versão)
- Visual Studio Code (recomendado)

## Configuração do Ambiente

1. **Clone o repositório** (se aplicável):
   ```bash
   git clone git@gitlab.pe.gov.br:gtd/testes_automatizados_ouvir_para_mudar.git
   cd testes_ouvir_para_mudar
   ```

2. **Crie e ative um ambiente virtual** (recomendado):
   ```bash
   # Windows
   python -m venv venv
   .\venv\Scripts\activate
   
   # Linux/MacOS
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Instale as dependências do projeto**:
   ```bash
   pip install -r requirements.txt
   ```

## Configuração do VS Code (Opcional, mas recomendado)

1. Instale a extensão "Robot Framework Language Server". Ela oferece:
   - Autocompletar (para keywords, variáveis, etc.)
   - Realce de sintaxe
   - Definição de keywords (Ctrl+Click para navegar até a keyword)
   - Análise de código em tempo real (linting)

2. **Importante**: Configure o VS Code para usar o interpretador Python do seu ambiente virtual.
   - Abra o VS Code na pasta do projeto.
   - Pressione `Ctrl+Shift+P` para abrir a paleta de comandos.
   - Digite e selecione "Python: Select Interpreter".
   - Escolha o interpretador que tem `(venv)` no nome e aponta para a pasta `venv` do seu projeto.

## Estrutura do Projeto

```
testes_ouvir_para_mudar/
├── automacao/           # Automações ex: ações envolvendo uma API (consumo, validação de end point)
├── resources/           # Recursos, variáveis e keywords comuns
├── tests/               # Casos de teste
├── results/             # Resultados dos testes (gerado automaticamente)
├── data/                # Arquivos de dados (ex: planilhas Excel)
├── venv/                # Ambiente virtual (não versionado)
├── .gitignore           # Arquivos a serem ignorados pelo Git
└── requirements.txt     # Dependências do projeto
```

## Executando os Testes

Para executar todos os testes:
```bash
robot -d results tests/
```

Para executar um teste específico:
```bash
robot -d results tests/nome_do_teste.robot
```

Para executar com tags específicas:
```bash
robot -d results -i smoke tests/
```

## Documentação

- [Documentação do Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- [ExcelLibrary](https://github.com/zero-88/robotframework-excel)

## Cursos

- [Blog4Linux](https://github.com/zero-88/robotframework-excel)
- [Horadoqa](https://github.com/horadoqa/curso-robot-framework?tab=readme-ov-file#8-boas-pr%C3%A1ticas-e-dicas-finais)
- [Introdução - O que é o Robot Framework](youtube.com/watch?v=r3SqIn_XWYch)
- [Robot Framework do Zero até automação do site da Amazon](youtube.com/watch?v=abcxIwF-d84h)
- [Aprenda Robot Framework(API)](youtube.com/watch?v=q8bFDxr4ykQ)
- [Como executar testes com CSV no robotFramework](youtube.com/watch?v=q8bFDxr4ykQ)
- [Como criar e escrever em planilhas excel com Robot Framework](https://www.youtube.com/watch?v=xaZgUpk9JXY)

## Boas práticas

1. Use nomes descritivos e em linguagem natural para os testes (exemplo: "Testar login com credenciais validas")
2. Seus casos de teste (*** Test Cases***) devem conter apenas chamadas para keywords(palavras-chave) que descrevem "o que" deve ser feito e não "como deve ser feito". Lembrando cada uma das linhas é uma keywird que você cria no seu arquivo de Resources
    - Exemplo: 
        *** Test Cases ***
        Cenário: Login com sucesso
            Dado que eu acesso a página de login
            Quando eu preencho as credenciais válidas
            E submeto o formulário
            Então eu devo ser redirecionado para a página inicial

3. Externalize as variáveis de ambiente e dados sensíveis para um arquivo .env. Coloque URLs, senhas ou caminhos de arquivos diretamente nos testes. Use a seção *** Variables *** pem um arquivo de recurso ou arquivos de variáveis Python/YAML.
    - Exemplo:
        *** Variables ***
        ${URL} https://www.google.com
        ${USER} admin
        ${PASSWORD} 123456
4. Abra um Pull Request

## Contribuição

1. Crie uma branch para sua feature (`git checkout -b feature/nova-códigoDaAtividade`)
2. Faça commit das suas alterações (`git commit -m 'Adiciona nova feature + código da atividade'`)
3. Faça push para a branch (`git push origin feature/nova-feature`)
4. Abra um Pull Request

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

Desenvolvido por Pablo Henrique