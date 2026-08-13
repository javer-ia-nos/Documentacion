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
#instruction[
  Descripción general de los requisitos funcionales del sistema. Debe resumir los contenidos del SRS. Todos los requisitos deben tener un identificador único para poder ser referenciados en secciones posteriores. \
  *Tamaño recomendado:* 1-2 páginas
]

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
