CREATE TABLE base.hm_d300_00_r29 (
	taxpayer varchar(100) NOT NULL, -- Отчитывающийся субъект
	ifns varchar(100) NOT NULL, -- Код налогового органа
	extra_key jsonb NOT NULL, -- Вид декларации/расчета
	fiscal_year int2 NOT NULL, -- Год
	"period" varchar(3) NOT NULL, -- Налоговый (отчетный) период
	corr_num int2 NOT NULL, -- Номер корректировки
	taxform varchar(100) NOT NULL, -- Код формы
	row_num numeric(10) NOT NULL, -- Номер строки
	balance_unit varchar(150) NOT NULL, -- Балансовая единица
	invoice_date_main date NOT NULL, -- Дата выписки основного счета-фактуры
	invoice_reg_num_corr numeric(20) NULL, -- Регистрационный номер исправленного счета-фактуры в ИС ЭСФ
	invoice_date_corr date NULL, -- Дата выписки исправленного счета-фактуры
	invoice_reg_num_add numeric(20) NULL, -- Регистрационный номер дополнительного счета-фактуры в ИС ЭСФ
	invoice_date_add date NULL, -- Дата дополнительного счета-фактуры
	turnover_date date NOT NULL, -- Дата совершения оборота по реализации
	reg_num varchar(150) NOT NULL, -- Регистрационный номер нерезидента
	"name" varchar(150) NOT NULL, -- Наименование контрагента
	turnover_amount_no_vat numeric(14, 0) NOT NULL, -- Сумма оборота по реализации, освобожденного от НДС
	quantity numeric(12) NULL, -- Количество
	unit varchar(150) NULL, -- Единица измерения
	unit_price numeric(23, 11) NULL, -- Стоимость за 1 единицу
	add_info varchar(150) NULL, -- Дополнительные показатели
	tax_code_article varchar(150) NOT NULL, -- Положение НК
	basis varchar(150) NOT NULL, -- Основание
	sys_date date NOT NULL, -- Дата системного
	sys_num numeric(20) NOT NULL, -- Номер системного
	id_transfer varchar(32) NOT NULL, -- Идентификатор пакета данных для передачи
	ernam varchar(12) NULL, -- Логин пользователя, создавшего объект
	erdat date NULL, -- Дата создания записи (по Алматы)
	loadtype boolean default true, -- Способ загрузки
	source_system varchar(50) NOT NULL, -- Идентификатор системы-источника
	version_reg numeric(3) NULL, -- Версия формы
	CONSTRAINT hm_d300_00_r29_secondary_key_base UNIQUE (taxpayer, ifns, extra_key, period, fiscal_year, corr_num, version_reg, taxform, invoice_date_main, invoice_reg_num_corr, invoice_date_corr, invoice_reg_num_add, invoice_date_add, sys_date, sys_num, id_transfer),
	CONSTRAINT hm_d300_00_r29_period_fkey FOREIGN KEY ("period") REFERENCES base.spr_period("period") ON DELETE RESTRICT ON UPDATE CASCADE
);
COMMENT ON TABLE base.hm_d300_00_r29 IS 'Налоговый регистр по строке 300.00.005 "Оборот, освобожденный от НДС"';

-- Column comments

COMMENT ON COLUMN base.hm_d300_00_r29.taxpayer IS 'Отчитывающийся субъект';
COMMENT ON COLUMN base.hm_d300_00_r29.ifns IS 'Код налогового органа';
COMMENT ON COLUMN base.hm_d300_00_r29.extra_key IS 'Вид декларации/расчета';
COMMENT ON COLUMN base.hm_d300_00_r29.fiscal_year IS 'Год';
COMMENT ON COLUMN base.hm_d300_00_r29."period" IS 'Налоговый (отчетный) период';
COMMENT ON COLUMN base.hm_d300_00_r29.corr_num IS 'Номер корректировки';
COMMENT ON COLUMN base.hm_d300_00_r29.taxform IS 'Код формы';
COMMENT ON COLUMN base.hm_d300_00_r29.row_num IS 'Номер строки';
COMMENT ON COLUMN base.hm_d300_00_r29.balance_unit IS 'Балансовая единица';
COMMENT ON COLUMN base.hm_d300_00_r29.invoice_date_main IS 'Дата выписки основного счета-фактуры';
COMMENT ON COLUMN base.hm_d300_00_r29.invoice_reg_num_corr IS 'Регистрационный номер исправленного счета-фактуры в ИС ЭСФ';
COMMENT ON COLUMN base.hm_d300_00_r29.invoice_date_corr IS 'Дата выписки исправленного счета-фактуры';
COMMENT ON COLUMN base.hm_d300_00_r29.invoice_reg_num_add IS 'Регистрационный номер дополнительного счета-фактуры в ИС ЭСФ';
COMMENT ON COLUMN base.hm_d300_00_r29.invoice_date_add IS 'Дата дополнительного счета-фактуры';
COMMENT ON COLUMN base.hm_d300_00_r29.turnover_date IS 'Дата совершения оборота по реализации';
COMMENT ON COLUMN base.hm_d300_00_r29.reg_num IS 'Регистрационный номер нерезидента';
COMMENT ON COLUMN base.hm_d300_00_r29."name" IS 'Наименование контрагента';
COMMENT ON COLUMN base.hm_d300_00_r29.turnover_amount_no_vat IS 'Сумма оборота по реализации, освобожденного от НДС';
COMMENT ON COLUMN base.hm_d300_00_r29.quantity IS 'Количество';
COMMENT ON COLUMN base.hm_d300_00_r29.unit IS 'Единица измерения';
COMMENT ON COLUMN base.hm_d300_00_r29.unit_price IS 'Стоимость за 1 единицу';
COMMENT ON COLUMN base.hm_d300_00_r29.add_info IS 'Дополнительные показатели';
COMMENT ON COLUMN base.hm_d300_00_r29.tax_code_article IS 'Положение НК';
COMMENT ON COLUMN base.hm_d300_00_r29.basis IS 'Основание';
COMMENT ON COLUMN base.hm_d300_00_r29.sys_date IS 'Дата системного';
COMMENT ON COLUMN base.hm_d300_00_r29.sys_num IS 'Номер системного';
COMMENT ON COLUMN base.hm_d300_00_r29.id_transfer IS 'Идентификатор пакета данных для передачи';
COMMENT ON COLUMN base.hm_d300_00_r29.ernam IS 'Логин пользователя, создавшего объект';
COMMENT ON COLUMN base.hm_d300_00_r29.erdat IS 'Дата создания записи (по Алматы)';
COMMENT ON COLUMN base.hm_d300_00_r29.loadtype IS 'Способ загрузки';
COMMENT ON COLUMN base.hm_d300_00_r29.source_system IS 'Идентификатор системы-источника';
COMMENT ON COLUMN base.hm_d300_00_r29.version_reg IS 'Версия формы';
