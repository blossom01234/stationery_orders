// Import and register all your controllers from the importmap under controllers/*


import { application } from "controllers/application"
// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import ImagePreviewController from './image_preview_controller'
application.register("image-preview", ImagePreviewController)
import CalcTotalController from './calc_total_controller'
application.register("cart", CalcTotalController)

import { Autocomplete } from 'stimulus-autocomplete'
application.register('autocomplete', Autocomplete)

import TableRow from './table_row'
application.register('table-row', TableRow)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
