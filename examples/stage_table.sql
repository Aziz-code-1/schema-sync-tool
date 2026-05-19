CREATE TABLE stage.hm_d300_00_r06 (
	taxpayer varchar(100) NOT NULL, -- Отчитывающийся субъект
	ifns varchar(100) NOT NULL, -- Код налогового органа
	extra_key jsonb NOT NULL, -- Вид декларации/расчета
	fiscal_year varchar(4) NOT NULL, -- Год
	"period" varchar(3) NOT NULL, -- Налоговый (отчетный) период
	corr_num int2 NOT NULL, -- Номер корректировки
	taxform varchar(100) NOT NULL, -- Код формы
	row_num numeric(10) NOT NULL, -- Номер строки
	balance_unit varchar(150) NOT NULL, -- Балансовая единица
	invoice_reg_num_main numeric(20) NOT NULL, -- Регистрационный номер основного счета-фактуры в ИС ЭСФ
	invoice_date_main date NOT NULL, -- Дата выписки основного счета-фактуры
	invoice_reg_num_corr numeric(28) NOT NULL, -- Регистрационный номер исправленного счета-фактуры в ИС ЭСФ
	invoice_date_corr date NULL, -- Дата выписки исправленного счета-фактуры
	invoice_reg_num_add numeric(20) NULL, -- Регистрационный номер дополнительного счета-фактуры в ИС ЭСФ
	invoice_date_add date NULL, -- Дата дополнительного счета-фактуры
	turnover_date date NOT NULL, -- Дата совершения оборота по реализации
	reg_num varchar(150) NOT NULL, -- Регистрационный номер нерезидента
	"name" varchar(150) NOT NULL, -- Наименование контрагента
	turnover_amount_no_vat numeric(14, 2) NOT NULL, -- Сумма оборота по реализации, освобожденного от НДС
	quantity numeric(12) NULL, -- Количество
	unit varchar(150) NULL, -- Единица измерения
	unit_price numeric(23, 11) NULL, -- Стоимость за 1 единицу
	add_info varchar(150) NULL, -- Дополнительные показатели
	basis varchar(150) NOT NULL, -- Основание
	sys_date date NOT NULL, -- Дата системного
	sys_num numeric(20) NOT NULL, -- Номер системного
	id_transfers varchar(32) NOT NULL, -- Идентификатор пакета данных для передачи
	ernam varchar(12) NULL, -- Логин пользователя, создавшего объект
	erdat date NULL, -- Дата создания записи (по Алматы)
	loadtype varchar(1) NULL, -- Способ загрузки
	source_system varchar(50) NOT NULL, -- Идентификатор системы-источника
	version_reg numeric(3) NULL, -- Версия формы
	CONSTRAINT hm_d300_00_r06_secondary_key_stage UNIQUE (taxpayer, ifns, extra_key, "period", fiscal_year, corr_num, version_reg, taxform, invoice_reg_num_main, invoice_date_main, invoice_reg_num_corr, invoice_date_corr, invoice_reg_num_add, invoice_date_add, sys_date, sys_num, id_transfers),
	CONSTRAINT hm_d300_00_r06_period_fkey FOREIGN KEY ("period") REFERENCES stage.spr_period("period") ON DELETE RESTRICT ON UPDATE CASCADE
);
COMMENT ON TABLE stage.hm_d300_00_r06 IS 'Налоговый регистр по строке 300.00.005 "Оборот, освобожденный от НДС"';

-- Column comments

COMMENT ON COLUMN stage.hm_d300_00_r06.taxpayer IS 'Отчитывающийся субъект';
COMMENT ON COLUMN stage.hm_d300_00_r06.ifns IS 'Код налогового органа';
COMMENT ON COLUMN stage.hm_d300_00_r06.extra_key IS 'Вид декларации/расчета';
COMMENT ON COLUMN stage.hm_d300_00_r06.fiscal_year IS 'Год';
COMMENT ON COLUMN stage.hm_d300_00_r06."period" IS 'Налоговый (отчетный) период';
COMMENT ON COLUMN stage.hm_d300_00_r06.corr_num IS 'Номер корректировки';
COMMENT ON COLUMN stage.hm_d300_00_r06.taxform IS 'Код формы';
COMMENT ON COLUMN stage.hm_d300_00_r06.row_num IS 'Номер строки';
COMMENT ON COLUMN stage.hm_d300_00_r06.balance_unit IS 'Балансовая единица';
COMMENT ON COLUMN stage.hm_d300_00_r06.invoice_reg_num_main IS 'Регистрационный номер основного счета-фактуры в ИС ЭСФ';
COMMENT ON COLUMN stage.hm_d300_00_r06.invoice_date_main IS 'Дата выписки основного счета-фактуры';
COMMENT ON COLUMN stage.hm_d300_00_r06.invoice_reg_num_corr IS 'Регистрационный номер исправленного счета-фактуры в ИС ЭСФ';
COMMENT ON COLUMN stage.hm_d300_00_r06.invoice_date_corr IS 'Дата выписки исправленного счета-фактуры';
COMMENT ON COLUMN stage.hm_d300_00_r06.invoice_reg_num_add IS 'Регистрационный номер дополнительного счета-фактуры в ИС ЭСФ';
COMMENT ON COLUMN stage.hm_d300_00_r06.invoice_date_add IS 'Дата дополнительного счета-фактуры';
COMMENT ON COLUMN stage.hm_d300_00_r06.turnover_date IS 'Дата совершения оборота по реализации';
COMMENT ON COLUMN stage.hm_d300_00_r06.reg_num IS 'Регистрационный номер нерезидента';
COMMENT ON COLUMN stage.hm_d300_00_r06."name" IS 'Наименование контрагента';
COMMENT ON COLUMN stage.hm_d300_00_r06.turnover_amount_no_vat IS 'Сумма оборота по реализации, освобожденного от НДС';
COMMENT ON COLUMN stage.hm_d300_00_r06.quantity IS 'Количество';
COMMENT ON COLUMN stage.hm_d300_00_r06.unit IS 'Единица измерения';
COMMENT ON COLUMN stage.hm_d300_00_r06.unit_price IS 'Стоимость за 1 единицу';
COMMENT ON COLUMN stage.hm_d300_00_r06.add_info IS 'Дополнительные показатели';
COMMENT ON COLUMN stage.hm_d300_00_r06.basis IS 'Основание';
COMMENT ON COLUMN stage.hm_d300_00_r06.sys_date IS 'Дата системного';
COMMENT ON COLUMN stage.hm_d300_00_r06.sys_num IS 'Номер системного';
COMMENT ON COLUMN stage.hm_d300_00_r06.id_transfers IS 'Идентификатор пакета передачи';
COMMENT ON COLUMN stage.hm_d300_00_r06.ernam IS 'Логин пользователя, создавшего объект';
COMMENT ON COLUMN stage.hm_d300_00_r06.erdat IS 'Дата создания записи (по Алматы)';
COMMENT ON COLUMN stage.hm_d300_00_r06.loadtype IS 'Способ загрузки';
COMMENT ON COLUMN stage.hm_d300_00_r06.source_system IS 'Идентификатор системы-источника';
COMMENT ON COLUMN stage.hm_d300_00_r06.version_reg IS 'Версия формы';
