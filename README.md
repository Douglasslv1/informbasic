# Interface — Informática Básica

Aplicação web em português para a aula inicial de Técnico em Mecânica. Paleta baseada nos verdes #023402 e #003300 da apresentação, com fundo escuro e destaques claros.

## Abrir

Execute `npm run dev` e acesse http://127.0.0.1:3000. Não requer instalação de dependências. O botão Apresentar solicita tela cheia. Roteiro do professor contém os tempos e o cronômetro do intervalo.

## Publicar na Vercel

1. Envie os arquivos deste projeto a um repositório GitHub.
2. Importe o repositório na Vercel.
3. Selecione Other no campo framework. O vercel.json configura o comando `npm run build` e a pasta de saída `dist`.
4. Publique e compartilhe o link com os alunos.

Não exige chaves, banco de dados ou variáveis de ambiente. A publicação não foi realizada nesta entrega.

## Roteiro de 180 minutos

Abertura 10 min; história 35 min; hardware e CPU 40 min; intervalo 10 min; memória 35 min; periféricos 30 min; missão e quiz 20 min. Os tempos incluem explicação, exploração e discussão, detalhadas no painel do professor. A navegação é livre, sem avanço automático.

## Atividades

Linha do tempo com seis marcos, placa virtual com seis componentes, ciclo de instruções em quatro passos, experimento RAM/SSD, bancada de oito bits, cálculo de armazenamento, classificação de oito periféricos, conexões, configuração de uma estação CAD e oito perguntas com feedback.

O progresso de etapas fica no navegador (localStorage). A reflexão permanece na sessão (sessionStorage). As respostas do quiz ficam apenas na página aberta. Recarregue para tentar o quiz novamente. O resumo individual pode ser baixado em texto. Não há sincronização de respostas ou placar entre alunos. Compartilhe a tela para conduzir as discussões coletivas.

## Material e referências

Base: apresentação fornecida pelo professor, TÉCNICO EM MECÂNICA - INFORMÁTICA BÁSICA.pptx, com 173 slides. Foi utilizado o recorte inicial solicitado. História e arquitetura são complementações, sem incluir o restante de Windows, Office e internet.

- https://www.computerhistory.org/timeline/computers/
- https://www.ibm.com/think/topics/cpu-use-cases

A classificação por gerações é didática. Unidades decimais e binárias são diferenciadas. A configuração CAD é um cenário ilustrativo, dependente dos requisitos do programa e do orçamento.

## Verificar e gerar

`npm run check` verifica a sintaxe JavaScript. `npm run build` gera os arquivos estáticos em dist. Interface responsiva, foco de teclado visível, explicações em texto e respeito à preferência de movimento reduzido.
