#set page(paper: "us-letter", numbering: "1", margin: (x: 2.5cm, y: 2.5cm))
#set text(font: "Times New Roman", size: 11pt, lang: "es")
#set heading(numbering: "1.1.")
#import "@preview/datify:1.3.0": display-date

// Función para resaltar las instrucciones que deben ser eliminadas
#let instruction(body) = block(
  fill: rgb("e6f2ff"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
  text(fill: rgb("003366"), size: 10pt, style: "italic")[
    *Instrucción:* #body
  ],
)

// --- Portada ---
#align(center)[
  #v(4cm)
  #text(size: 24pt, weight: "bold")[Sistema Bancario]
  // #v(1cm)
  // #text(size: 14pt)[Plantilla basada en el estándar arc42]
  #v(2cm)
  #text(size: 12pt)[
    *Equipo:* Javer-IA-nos \
    *Organización:* Pontificia Universidad Javeriana \
    *Fecha de entrega:* #display-date(datetime.today()) \
    *Versión actual:* v0.0.0 \ \
    *Autores:* \ Miguel Francisco Vargas \
    Sara Rodriguez Urueña \
    Juliana Sofia Novoa Solano \
    Salomon Alfredo Avila Larrotta \
    Samuel Beltrán Martínez \
    Arantxa Marian Espejo Malagon
  ]
]

#pagebreak()

#instruction[
  Esta plantilla está basada en el estándar arc42 https://arc42.org/overview \
  A continuación, encontrará las secciones requeridas para su entrega del documento de Descripción de la Arquitectura del Software. Todos los párrafos del color de este texto son las instrucciones para completar cada sección. Deben ser removidos del documento a entregar.
]

= Historial de Cambios
#instruction[
  *Propósito:* Describir brevemente los cambios que ha sufrido el documento, con el fin de llevar una adecuada administración de configuración. \
  *Contenido:* Una tabla que indique los cambios que ha sufrido el documento. Debe incluir, al menos: fecha del cambio, descripción del cambio y persona(s) que realizaron el cambio.
]

#align(center)[
  #table(
    columns: (1fr, 3fr, 2fr),
    align: left,
    stroke: 0.5pt + luma(200),
    fill: (col, row) => if row == 0 { rgb("f0f0f0") } else { none },
    [*Fecha*], [*Descripción del cambio*], [*Autor(es)*],
    [YYYY-MM-DD], [Versión inicial], [Nombre],
  )
]

#pagebreak()

#outline(title: [Tabla de Contenidos], depth: 3, indent: auto)
#instruction[
  *Propósito:* Encontrar rápidamente una sección específica del documento. El resumen, y las listas de figuras y tablas no se incluyen en esta sección. La tabla de contenidos comienza en la Introducción, que es la página uno del documento.
]

#pagebreak()
#set page(numbering: "1")
#counter(page).update(1)

= Introducción
#instruction[
  *Propósito:* que el lector entienda los elementos más generales del documento y determine si vale la pena seguir leyéndolo. \
  *Contenido:*
  - Una breve explicación de qué trata el sistema.
  - Principales objetivos de negocio que el sistema debe cumplir.
  - Principales atributos de calidad que debe satisfacer la arquitectura.
  - Cuáles son las principales secciones del documento y de qué trata cada una. \
  *Tamaño recomendado:* 1-2 páginas
]

= Visión general de los requisitos funcionales

A continuación se detallan los 30 casos de uso funcionales del sistema bancario, estructurados de forma modular y con identificadores únicos, desglosando componentes clave como cuentas, tarjetas, canales de atención y seguridad:

#table(
  columns: (auto, auto, auto, auto),
  stroke: 0.5pt + gray,
  fill: (x, y) => if y == 0 { luma(230) },
  table.header([*ID*], [*Caso de Uso*], [*Descripción Detallada*], [*Categoría*]),
  
  [CU-01], [*Historial de actividad y sesiones*], [Auditoría de inicios de sesión y registros de actividad de la cuenta.], [Auditoría],
  [CU-02], [*Chat de atención al cliente*], [Soporte interactivo en línea para resolución de dudas.], [CRM],
  [CU-03], [*Gestión de beneficiarios (CRM)*], [Registro, actualización y administración de contactos frecuentes para transferencias.], [CRM],
  [CU-04], [*Gestión de solicitudes PQRS*], [Radicación y seguimiento de Peticiones, Quejas, Reclamos y Solicitudes.], [CRM],
  [CU-05], [*Reclamaciones por transacciones*], [Revisión y disputas por transacciones no reconocidas o fraudulentas.], [CRM],
  [CU-06], [*Gestión de cuentas corrientes (CRUD)*], [Apertura, modificación, consulta y cancelación de cuentas corrientes.], [Cuentas],
  [CU-07], [*Gestión de cuentas de ahorros (CRUD)*], [Apertura, modificación, consulta y cancelación de cuentas de ahorros.], [Cuentas],
  [CU-08], [*Gestión de subcuentas*], [Permitir al usuario separar dinero del saldo disponible en subcuentas de ahorro.], [Cuentas],
  [CU-09], [*Programación de ahorro automático*], [Automatización de transferencias periódicas hacia metas o subcuentas de ahorro.], [Cuentas],
  [CU-10], [*Certificados bancarios*], [Generación automatizada de certificados de cuentas y productos.], [Financiero],
  [CU-11], [*Consulta de saldo y movimientos*], [Visualización en tiempo real del saldo disponible y extractos detallados.], [Financiero],
  [CU-12], [*Solicitud de CDT e inversiones*], [Creación de certificados de depósito a término y consulta de rendimientos.], [Financiero],
  [CU-13], [*Solicitud y gestión de préstamos*], [Aprobación, seguimiento y amortización de créditos bancarios.], [Financiero],
  [CU-14], [*Notificaciones de movimientos*], [Envío de alertas instantáneas vía push, SMS o correo por cualquier tipo de transacción.], [Notificaciones],
  [CU-15], [*Autenticación de usuarios*], [Acceso al sistema mediante credenciales.], [Seguridad],
  [CU-16], [*Autorización y control de roles*], [Verificación de permisos según el perfil del usuario autenticado.], [Seguridad],
  [CU-17], [*Gestión de dispositivos confiables*], [Registro, consulta y revocación de dispositivos seguros autorizados.], [Seguridad],
  [CU-18], [*Gestión de seguridad de la cuenta*], [Cambio de claves, segundo factor y políticas de protección contra fraude.], [Seguridad],
  [CU-19], [*Límites y permisos de transacciones*], [Establecimiento de topes máximos diarios y por operación.], [Seguridad],
  [CU-20], [*Bloqueo y desbloqueo de tarjetas*], [Inhabilitación temporal o definitiva de tarjetas en caso de robo o pérdida.], [Tarjetas],
  [CU-21], [*Emisión y gestión de tarjetas de crédito*], [Solicitud, activación y configuración de tarjetas de crédito.], [Tarjetas],
  [CU-22], [*Emisión y gestión de tarjetas de débito*], [Solicitud, activación y configuración de tarjetas de débito.], [Tarjetas],
  [CU-23], [*Realización de avances de tarjeta de crédito*], [Desembolso de efectivo a partir del cupo de la tarjeta de crédito.], [Tarjetas],
  [CU-24], [*Administración de pagos automáticos*], [Configuración de débitos programados y cobros periódicos automáticos.], [Transacciones],
  [CU-25], [*Generación y escaneo de códigos QR*], [Cobros y pagos inmediatos mediante códigos QR.], [Transacciones],
  [CU-26], [*Gestión de transferencias internacionales*], [Envío y recepción de fondos hacia o desde el exterior.], [Transacciones],
  [CU-27], [*Pago de facturas de servicios*], [Cancelación de servicios públicos y privados mediante convenios registrados.], [Transacciones],
  [CU-28], [*Pagos físicos y transacciones presenciales*], [Gestión de cheques y consignaciones en ventanilla o canales físicos.], [Transacciones],
  [CU-29], [*Soporte para billeteras externas*], [Vinculación de tarjetas a plataformas como Apple Pay o Google Wallet.], [Transacciones],
  [CU-30], [*Transferencias entre cuentas propias y a terceros*], [Envío de fondos entre cuentas del mismo banco o cuentas interbancarias.], [Transacciones],
)

= Modelo de dominio
#instruction[
  Diagrama que muestra los principales conceptos del sistema y sus relaciones. \
  *Contenido:* \
  - Diagramas de clases UML, donde cada clase representa un concepto del sistema (ver https://www.uml-diagrams.org/examples/hospital-domain-diagram.html) \
  - Tabla con las siguientes columnas: Concepto, Explicación
]

#table(
  columns: (1fr, 3fr),
  fill: (col, row) => if row == 0 { rgb("f0f0f0") } else { none },
  [*Concepto*], [*Explicación*],
  [], [],
)

= Stakeholders e intereses
#instruction[
  Una tabla que especifique cada stakeholder, su información de contacto y qué intereses o expectativas tiene sobre el sistema que se está desarrollando (cómo espera beneficiarse del mismo).
]

#table(
  columns: (1fr, 2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("f0f0f0") } else { none },
  [*Rol/Nombre*], [*Información de Contacto*], [*Intereses / expectativas*],
  [], [], [],
)

= Requisitos Arquitectónicamente Significativos (ASR)
#instruction[
  Un Árbol de Utilidad, en formato tabular, que relacione los principales atributos de calidad con los requisitos funcionales, ordenados por prioridad. \
  - La columna "ID ASR" debe contener un identificador único de cada requisito. \
  - La columna "Atributo de calidad" debe señalar el atributo de calidad relevante para el ASR. Un mismo atributo puede formar parte de varios ASR. \
  - La columna "Sub-atributo" debe señalar el sub-atributo de calidad relevante. \
  - La columna "Funcionalidades" debe indicar los identificadores únicos de casos de uso, historias de usuario o requisitos funcionales relevantes. \
  - La columna "Escenarios ASR" debe describir los escenarios relevantes de cada ASR. \
  Si la tabla no es suficientemente ancha, cambie la orientación de la página a horizontal o use una hoja de cálculo anexa.
]

#set text(size: 9pt)
#table(
  columns: (auto, auto, auto, auto, 2fr, 2fr, auto),
  fill: (col, row) => if row == 0 { rgb("f0f0f0") } else { none },
  [*ID ASR*],
  [*Título del ASR*],
  [*Atributo de calidad*],
  [*Sub-atributo*],
  [*Funcionalidades*],
  [*Escenarios ASR*],
  [*Prioridad*],

  [], [], [], [], [], [], [],
)
#set text(size: 11pt)

= Restricciones
#instruction[
  Indique cualquier restricción que limite la libertad de los ingenieros a la hora de decidir la arquitectura del sistema y las soluciones a los ASR. Las principales categorías de restricciones son: \
  - *Técnicas:* Directamente relacionadas con las tecnologías, métodos de ingeniería, sistemas de software, etc. \
  - *Organizacionales/políticas:* Situaciones internas o externas a la organización y de las personas que limiten las decisiones arquitectónicas del sistema. \
  - *Convencionales:* Necesidades de seguimiento de estándares, guías de codificación, leyes, etc.
]

#table(
  columns: (1fr, 1fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("f0f0f0") } else { none },
  [*Restricción*], [*Categoría*], [*Descripción*],
  [], [], [],
)

= Contexto y Alcance
#instruction[
  Relación entre el sistema y su entorno (personas y otros sistemas). \
  *Contenido:* \
  - C4 Context Diagram o C4 System Landscape Diagram. Debe incluir todos los elementos externos relevantes (Actores, Sistemas externos). \
  - Explicación del diagrama.
]

= Vista de contenedores
#instruction[
  Describir los contenedores y sus relaciones entre sí. \
  *Contenido:* C4 Container Diagram y explicación del diagrama.
]

= Vista de componentes
#instruction[
  Para cada contenedor de la sección anterior, describir sus componentes y relaciones entre sí. \
  *Contenido:* C4 Component Diagram (al menos uno por cada contenedor de la sección anterior) y explicación de cada diagrama.
]

= Vista de procesos
#instruction[
  Describir el comportamiento de las partes más críticas del sistema. No es necesario detallar el comportamiento de todos los elementos del sistema, sino solo aquellos más críticos en relación con los atributos de calidad. \
  *Contenido:* Para cada parte del sistema que lo requiera, un C4 Dynamic Diagram y explicación para cada diagrama.
]

= Vista física
#instruction[
  Para cada ambiente de ejecución (desarrollo, pruebas y producción), describir cómo se desplegarán los contenedores del sistema. \
  *Contenido:* C4 Deployment Diagram, al menos uno por cada ambiente de ejecución, y explicación de cada diagrama.
]

= Modelo de datos
#instruction[
  Si aplica, esta sección debe mostrar todos los modelos de datos persistentes usados en la aplicación: modelos ER, modelos de entidades, etc. Si es una arquitectura distribuida, indicar claramente a qué componentes o contenedores aplica cada modelo de datos. \
  *Contenido:* diagramas y su correspondiente explicación.
]

= Registros de Decisiones Arquitectónicas (ADR)
#instruction[
  Detallar la solución a cada ASR de alta prioridad mencionado en la sección "Requisitos Arquitectónicamente Significativos (ASR)". Cada ASR puede tener asociado uno o varios Registros de Decisiones de Diseño (ADR). \
  *Contenido:* Para cada decisión de alta prioridad, una subsección con los siguientes elementos: \
  - ID y Título del ADR. \
  - ID y Título del ASR. \
  - Problema: Descripción detallada del problema a resolver. \
  - Solución: Descripción detallada de la decisión. Típicamente requiere referenciar diagramas. Detallar: Tecnologías seleccionadas, Patrones y estilos, Metodologías/procesos. \
  - Consecuencias: positivas y negativas de dicha decisión.
]

= Riesgos técnicos
#instruction[
  Indicar todo lo que puede salir mal producto de cómo ha sido definida la arquitectura. Por ejemplo, componentes que pueden funcionar mal bajo ciertas condiciones, eventos que pueden hacer que se incumplan algunos atributos de calidad, etc. \
  *Contenido:* Tabla de riesgos ordenados por prioridad (Alta probabilidad + alto impacto = alta prioridad; Baja probabilidad + bajo impacto = baja prioridad). \
  - *Plan de mitigación:* qué hacer para reducir la probabilidad de que ocurra el riesgo. \
  - *Plan de contingencia:* qué hacer si el riesgo se materializa ("plan B").
]

#set text(size: 9pt)
#table(
  columns: (1fr, auto, auto, auto, 2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("f0f0f0") } else { none },
  [*Riesgo*], [*Probabilidad*], [*Impacto*], [*Prioridad*], [*Plan de mitigación*], [*Plan de contingencia*],
  [], [], [], [], [], [],
)
#set text(size: 11pt)

= Glosario
#instruction[
  Enumerar y describir todos los términos técnicos y del negocio que se hayan mencionado en el documento. Asuma que el lector puede ser técnico (sin conocimiento del dominio del problema) o no técnico (sin conocimiento de las tecnologías), por lo tanto, el glosario debe ser suficientemente amplio para satisfacer ambas audiencias.
]

= Referencias
#instruction[
  Referencias bibliográficas en formato APA o IEEE que hayan sido usadas en el documento[cite: 1].
]
