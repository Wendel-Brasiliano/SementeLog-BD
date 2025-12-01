# 📦 SementeLog - Sistema de Gestão de Suprimentos (IPA/PE)

> **Projeto Integrador (PI) - Desenvolvimento de Sistemas**
>
> **Instituição:** FACULDADE SENAC-PE
> **PROJETO INTEGRADOR:**Instituto Agronômico de Pernambuco (IPA)
> **Abrangência:** Estado de Pernambuco

### 👨‍💻 Equipe de Desenvolvimento:
* **Wendel Brasiliano**
* **Marcelo Barbosa**
* **Lucas**
* **Caio**
* **Isack**

---

## 1. 📝 Minimundo

O projeto **SementeLog** consiste no desenvolvimento de um banco de dados para suportar o Sistema de Informação Gerencial (SIG) do **Instituto Agronômico de Pernambuco (IPA)**. O objetivo é controlar a cadeia de distribuição de sementes para a agricultura familiar em PE.

O sistema gerencia:
1.  **Cadastros:** Funcionários (Gestor/Técnico), Fornecedores e Cooperativas de PE.
2.  **Entrada:** Ordens de Compra e recebimento via Lotes (Rastreabilidade).
3.  **Estoque:** Controle de validade e alertas de reposição nos galpões.
4.  **Saída:** Distribuição para Cooperativas com fluxo de aprovação (Técnico solicita -> Gestor aprova).

---

## 2. 📂 Estrutura dos Arquivos SQL

Abaixo a lista dos scripts desenvolvidos para o projeto, presentes neste repositório:

| Arquivo | Descrição |
| :--- | :--- |
| **`Script_SementeLog_atualizado.sql`** | **DDL:** Criação das tabelas e estrutura do banco. |
| **`INSERTS_SementeLOG.sql`** | **DML:** Inserção dos dados de teste (20 registros de sementes, fornecedores, etc). |
| **`Scripts_Relatorios_DML_SementeLog.sql`** | **DQL:** Contém os **20 Relatórios Gerenciais** (Selects com Joins). |
| **`Script_SementeLog_Views.sql`** | Criação das **10 Views** do sistema. |
| **`Scripts_E_Procedures_Pt1.sql`** | Parte 1 das automações (Stored Procedures). |
| **`Scripts_E_Procedures_Pt2.sql`** | Parte 2 das automações (Stored Procedures). |
| **`Script_SementeLog_Triggers.sql`** | Criação das **12 Triggers** de auditoria. |
| **`Script_SementeLog_Triggers_Testes.sql`** | Script de validação para testar as triggers. |
| **`SementeLogDiagramaatualizado.mwb`** | Arquivo fonte do MySQL Workbench. |

---

## 3. 🗺️ Modelagem

O banco conta com 12 tabelas normalizadas para atender a logística do estado.

> *[DICA: Apague esta linha e arraste o arquivo 'Diagrama atualizadoSementeLog.png' aqui para a imagem aparecer]*

---

## 4. 🚀 Como Rodar

1. Execute o `Script_SementeLog_atualizado.sql` para criar o banco `mydb`.
2. Execute o `INSERTS_SementeLOG.sql` para popular os dados.
3. Execute os demais scripts para criar as funcionalidades e gerar os relatórios.
