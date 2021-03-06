###*
* Grid view for {Phoenix.model.Scenario} models.
###
Ext.define( "Phoenix.view.ScenarioGrid",
	extend: "Ext.grid.Panel"
	alias: "widget.phoenix-view-scenarioGrid"
	controller: "Phoenix.controller.ScenarioGridController"
	requires: [
		"Ext.grid.column.Number"
		"Ext.grid.column.Date"
		"Ext.grid.column.Action"
	]
	inject: [
		"scenarioStore"
		"probabilityStore"
	]


	config:
		scenarioStore: null
		probabilityStore: null


	title: "Scenarios"


	initComponent: ->

		Ext.apply( @,

			store: @getScenarioStore()

			columns: [
				header: "Scenario Name"
				dataIndex: "name"
				flex: 1
				minWidth: 140
			,
				header: "Description"
				dataIndex: "description"
				flex: 1
				renderer: ( value, metaData, record ) =>
					metaData.tdAttr = "data-qtip='#{ value }'"
					return value
			,
				header: "Probability"
				dataIndex: "probabilityId"
				width: 145
				renderer: ( value, metaData, record, row, col, store, gridView ) =>
					return @getProbabilityStore().getById( value )?.get( "value" )
			,
				xtype: "numbercolumn"
				header: "Plan Cost / Day"
				dataIndex: "planCost"
				width: 85
				renderer: "usMoney"
			,
				xtype: "numbercolumn"
				header: "Impact Cost / Day"
				dataIndex: "impactCost"
				width: 100
				renderer: "usMoney"
			,
				xtype: "numbercolumn"
				header: "Length (Days)"
				dataIndex: "impactLength"
				width: 80
			,
				xtype: "numbercolumn"
				header: "Total Impact Cost"
				dataIndex: "totalImpact"
				width: 105
				renderer: "usMoney"
			,
				header: "Plan Effectiveness"
				dataIndex: "planEffectiveness"
				width: 105
				renderer: ( value, metaData, record ) ->
					metaData.tdCls = value
					return value
			,
				xtype: "datecolumn"
				text: "Updated"
				dataIndex: "dateUpdated"
				format:"m-d-Y g:i A"
				width: 110
			,
				xtype: "actioncolumn"
				itemId: "scenarioActionColumn"
				text: "Delete"
				width: 50
				align: "center"
				sortable: false
				items: [
					itemId: "scenarioDeleteButton"
					icon: "resources/icons/delete.png"
					tooltip: "Delete Scenario"
					iconCls: "mousepointer .x-grid-center-icon"
				]
			]

			columnLines: true

			viewConfig:
				stripeRows: true
				emptyText: "<div class='x-grid-empty-custom'>There are no Scenarios defined yet.</div>"
				deferEmptyText: false

			tbar: [
				text: "New Scenario"
				itemId: "addButton"
				iconCls: "add-icon"
			,
				xtype: "component"
				html: " (Double click row to edit)"
			]

		)

		@callParent( arguments )

)