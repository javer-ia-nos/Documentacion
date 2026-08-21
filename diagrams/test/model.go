package model

import . "goa.design/model/dsl"

var _ = Design("Sistema de Banca Digital", "Diagrama de Contexto del Sistema (C4 - Nivel 1)", func() {

	var PasarelaPagos = SoftwareSystem("Pasarela de Pagos Internacionales",
		"Procesa transferencias internacionales y liquidaciones interbancarias (CU-26, ASR-01).",
		func() {
			External()
			Tag("externo")
		})

	var BilleterasExternas = SoftwareSystem("Billeteras Digitales Externas",
		"Apple Pay, Google Wallet y otras billeteras vinculadas a tarjetas del banco (CU-29, ASR-04).",
		func() {
			External()
			Tag("externo")
		})

	var ConveniosServicios = SoftwareSystem("Proveedores de Servicios Públicos",
		"Empresas con convenio de recaudo para pago de facturas (CU-27, ASR-04).",
		func() {
			External()
			Tag("externo")
		})

	var SistemaNotificaciones = SoftwareSystem("Proveedor de Notificaciones",
		"Servicio externo de envío de SMS, correo electrónico y push (CU-14).",
		func() {
			External()
			Tag("externo")
		})

	var BurCredito = SoftwareSystem("Central de Riesgo - Bureau de Crédito",
		"Consulta de score crediticio para aprobación de préstamos (CU-13).",
		func() {
			External()
			Tag("externo")
		})

	var EnteRegulador = SoftwareSystem("Ente Regulador Financiero",
		"Organismo de supervisión que recibe reportes de auditoría y cumplimiento (CU-01, ASR-03, ASR-06).",
		func() {
			External()
			Tag("externo")
		})

	var SistemaBancario = SoftwareSystem("Sistema de Banca Digital",
		"Permite a los clientes gestionar cuentas, tarjetas, transacciones, préstamos e inversiones de forma segura.",
		func() {
			Tag("interno")
			Uses(PasarelaPagos, "Envía y recibe fondos de transferencias internacionales", "API REST / SWIFT")
			Uses(BilleterasExternas, "Sincroniza y valida tarjetas vinculadas", "API REST")
			Uses(ConveniosServicios, "Envía pagos de facturas registradas", "API REST")
			Uses(SistemaNotificaciones, "Envía alertas de movimientos y eventos de seguridad", "API REST")
			Uses(BurCredito, "Consulta historial crediticio del solicitante", "API REST")
			Uses(EnteRegulador, "Reporta eventos de auditoría y cumplimiento normativo", "SFTP / API")
		})

	Person("Cliente Bancario",
		"Usuario que accede a los servicios de banca digital para gestionar sus productos financieros (CU-01 a CU-30).",
		func() {
			Uses(SistemaBancario, "Consulta saldos, realiza transferencias, gestiona tarjetas y solicita productos financieros", "HTTPS")
			Tag("persona")
		})

	Person("Agente de Atención al Cliente",
		"Empleado del banco que atiende chats de soporte y gestiona PQRS (CU-02, CU-04).",
		func() {
			Uses(SistemaBancario, "Gestiona PQRS y atiende el chat de soporte", "HTTPS")
			Tag("persona")
		})

	Views(func() {
		SystemContextView(SistemaBancario, "SystemContext", "Diagrama de Contexto del Sistema de Banca Digital.", func() {
			AddAll()
			AutoLayout(RankLeftRight)
		})

		Styles(func() {
			ElementStyle("persona", func() {
				Shape(ShapePerson)
				Background("#08427b")
				Color("#ffffff")
			})
			ElementStyle("interno", func() {
				Background("#1168bd")
				Color("#ffffff")
			})
			ElementStyle("externo", func() {
				Background("#999999")
				Color("#ffffff")
			})
		})
	})
})