# SW Flutter Carlos

## Arquitetura: MVVM (Model-View-ViewModel)

**Por que MVVM?**
- **Separação de responsabilidades:** Facilita a manutenção e evolução do código, separando regras de negócio (ViewModel/Provider), dados (Model/Service/API) e interface (View).
- **Testabilidade:** Permite testar lógica de negócio sem depender da interface.
- **Reatividade:** O Provider notifica a View sobre mudanças de estado, mantendo a UI sempre sincronizada.

---

## Gerenciamento de Estado: Provider

**Por que Provider?**
- **Simplicidade e integração nativa:** Provider é recomendado pela equipe Flutter, é leve e fácil de usar.
- **Reatividade:** Permite que a UI reaja automaticamente a mudanças de estado.
- **Escalabilidade:** Suporta múltiplos providers, composição e escopo de instâncias.
- **Integração com injeção de dependência:** Funciona perfeitamente com GetIt.

---

## Injeção de Dependência: GetIt

**Por que GetIt?**
- **Desacoplamento:** Os providers e services não conhecem detalhes de criação de dependências.
- **Reaproveitamento:** Permite compartilhar instâncias (singleton ou factory) em todo o app.
- **Escalabilidade:** Suporta projetos grandes e complexos.

---

## Autenticação: OAuth2
**Como o OAuth2 está estruturado no projeto?**

- **Armazenamento seguro:** O refresh token e o access token são salvos utilizando o `FlutterSecureStorage`, garantindo que as credenciais fiquem protegidas no dispositivo.
- **API/Interceptor:** O pacote Dio utiliza um interceptor customizado (`AuthInterceptor`) para adicionar o token de acesso em todas as requisições e interceptar respostas 401. Quando o token expira, o interceptor automaticamente tenta renovar o access token usando o refresh token salvo.
- **Fluxo:** Ao iniciar o app, o provider verifica se há tokens válidos no storage. Se necessário, aciona o refresh automático. O logout remove os tokens do storage e atualiza o estado global.

---

## Camadas do Projeto

- **API:** Responsável por requisições HTTP (Dio).
- **Service:** Responsável pelas regras de negócio.
- **Provider (ViewModel):** Gerencia estado, expõe métodos e dados para a View, notifica mudanças.
- **View:** Interface do usuário, consome dados do Provider e exibe esses dados na tela.

---

## Outras Decisões

- **Dio:** Usado para requisições HTTP por sua flexibilidade, interceptors e fácil integração com OAuth2.
- **StatusNotifier:** Mixin para padronizar estados (idle, loading, success, error) nos providers.
- **ThemeProvider:** Permite alternância entre temas claro/escuro, com persistência.
- **ColorPalette:** Centraliza cores, mas para cores dinâmicas recomenda-se usar Theme.of(context).
- **Widgets customizados:** Componentes reutilizáveis para campos, botões e feedback visual.

---

## Resumo

O projeto adota padrões modernos de arquitetura Flutter, com foco em separação de responsabilidades, reatividade, injeção de dependência e segurança. As escolhas de MVVM, Provider, GetIt e OAuth2 garantem um código limpo, escalável e fácil de manter.

---

Se tiver dúvidas sobre alguma decisão ou quiser adaptar para outro padrão, basta abrir uma issue ou PR!
