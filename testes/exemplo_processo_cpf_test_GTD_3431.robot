***Settings***
Library    SeleniumLibrary
Library    ExcelLibrary
Library    OperatingSystem

***Variables***
${BROWSER}           chrome
${URL_SISTEMA}       https://url.do.sistema.que.usa.cpf/
${ARQUIVO_CPFS}      ../data/cpfs.xlsx
${PASTA_SCREENSHOTS}    ../screenshots

***Tasks***
Processar Lote de CPFs do Excel
    # Garante que a pasta principal de screenshots exista
    Create Directory    ${PASTA_SCREENSHOTS}

    # Abre a planilha para leitura
    Open Excel Document    filename=${ARQUIVO_CPFS}    doc_id=cpfs

    # Pega a quantidade de linhas para saber até onde o loop deve ir
    ${total_linhas}=    Get Row Count    sheet_name=Sheet1

    # Loop que começa da linha 2 (para pular o cabeçalho "CPF") e vai até o fim
    FOR    ${linha}    IN RANGE    2    ${total_linhas} + 1
        ${cpf_atual}=    Read Cell Data    sheet_name=Sheet1    row_num=${linha}    column_num=1
        Log To Console    \n--- Processando CPF: ${cpf_atual} ---

        # Executa o fluxo de teste para o CPF atual, passando o CPF como argumento
        Executar Fluxo para CPF    ${cpf_atual}
    END

    # Fecha a planilha no final de tudo
    Close Excel Document    doc_id=cpfs

***Keywords***
Executar Fluxo para CPF
    [Arguments]    ${cpf}

    # 1. Cria uma pasta específica para este CPF
    ${pasta_do_cpf}=    Catenate    SEPARATOR=/    ${PASTA_SCREENSHOTS}    ${cpf}
    Create Directory    ${pasta_do_cpf}

    # 2. Inicia o fluxo
    Open Browser    ${URL_SISTEMA}    ${BROWSER}
    Maximize Browser Window

    # 3. Momento específico 1: Tela inicial
    Capture Page Screenshot    ${pasta_do_cpf}/01_tela_inicial.png

    # ... aqui você coloca os passos do seu fluxo ...
    # Exemplo: preencher o CPF em um campo
    Input Text    id:campo_cpf    ${cpf}
    Click Button    id:botao_avancar

    # 4. Momento específico 2: Após inserir o CPF e avançar
    Wait Until Element Is Visible    id:proxima_etapa
    Capture Page Screenshot    ${pasta_do_cpf}/02_apos_inserir_cpf.png

    # ... mais passos do fluxo ...
    # Exemplo: preencher mais algum dado
    Input Text    id:outro_dado    algum valor
    Click Button    id:botao_finalizar

    # 5. Momento específico 3: Tela final do processo
    Wait Until Page Contains    Processo Finalizado com Sucesso
    Capture Page Screenshot    ${pasta_do_cpf}/03_tela_final.png

    # 6. Finaliza o fluxo para este CPF
    Close Browser