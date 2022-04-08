{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 41.0, 84.0, 1191.0, 713.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "OSCTimeTag" ],
					"patching_rect" : [ 1770.0, 20.97560977935791, 111.0, 22.0 ],
					"text" : "OpenSoundControl"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"fontsize" : 16.0,
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 559.0, 1189.95934921503067, 95.0, 28.0 ],
					"text" : "topmost 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"fontsize" : 16.0,
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 559.0, 1156.0, 95.0, 28.0 ],
					"text" : "topmost 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"fontsize" : 16.0,
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 692.0, 1156.0, 143.0, 28.0 ],
					"text" : "zoomfactor 0.8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"fontsize" : 16.0,
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 730.68292635679245, 1189.95934921503067, 143.0, 28.0 ],
					"text" : "zoomfactor 0.9"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"fontsize" : 16.0,
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 814.0, 1255.222221851348877, 142.0, 28.0 ],
					"text" : "zoomfactor 1.2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"fontsize" : 16.0,
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 774.0, 1222.222221851348877, 134.0, 28.0 ],
					"text" : "zoomfactor 1."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 559.0, 1282.0, 88.0, 23.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-340",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1350.0, 901.95934921503067, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-341",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1320.0, 868.95934921503067, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-342",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1290.0, 811.95934921503067, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-343",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.0, 841.95934921503067, 167.0, 23.0 ],
					"text" : "match /pod18/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-344",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 811.95934921503067, 167.0, 23.0 ],
					"text" : "match /pod18/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-345",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1290.0, 781.95934921503067, 147.0, 23.0 ],
					"text" : "match /pod18/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-346",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1110.0, 901.95934921503067, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-347",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1080.0, 868.95934921503067, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-348",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1050.0, 811.95934921503067, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-349",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1110.0, 841.95934921503067, 167.0, 23.0 ],
					"text" : "match /pod17/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-350",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1080.0, 811.95934921503067, 167.0, 23.0 ],
					"text" : "match /pod17/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-351",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1050.0, 781.95934921503067, 147.0, 23.0 ],
					"text" : "match /pod17/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-316",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1830.0, 730.861788332462311, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-317",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1800.0, 697.861788332462311, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-318",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1770.0, 640.861788332462311, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-319",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1830.0, 670.861788332462311, 167.0, 23.0 ],
					"text" : "match /pod16/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-320",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1800.0, 640.861788332462311, 167.0, 23.0 ],
					"text" : "match /pod16/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-321",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1770.0, 610.861788332462311, 147.0, 23.0 ],
					"text" : "match /pod16/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-322",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1590.0, 730.861788332462311, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-323",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1560.0, 697.861788332462311, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-324",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1530.0, 640.861788332462311, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-325",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1590.0, 670.861788332462311, 167.0, 23.0 ],
					"text" : "match /pod15/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-326",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1560.0, 640.861788332462311, 167.0, 23.0 ],
					"text" : "match /pod15/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-327",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1530.0, 610.861788332462311, 147.0, 23.0 ],
					"text" : "match /pod15/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-328",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1350.0, 730.861788332462311, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-329",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1320.0, 697.861788332462311, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-330",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1290.0, 640.861788332462311, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-331",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.0, 670.861788332462311, 167.0, 23.0 ],
					"text" : "match /pod14/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-332",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 640.861788332462311, 167.0, 23.0 ],
					"text" : "match /pod14/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-333",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1290.0, 610.861788332462311, 147.0, 23.0 ],
					"text" : "match /pod14/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-334",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1110.0, 730.861788332462311, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-335",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1080.0, 697.861788332462311, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-336",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1050.0, 640.861788332462311, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-337",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1110.0, 670.861788332462311, 167.0, 23.0 ],
					"text" : "match /pod13/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-338",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1080.0, 640.861788332462311, 167.0, 23.0 ],
					"text" : "match /pod13/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-339",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1050.0, 610.861788332462311, 147.0, 23.0 ],
					"text" : "match /pod13/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-292",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1830.0, 558.951219320297241, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-293",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1800.0, 525.951219320297241, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-294",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1770.0, 468.951219320297241, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-295",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1830.0, 498.951219320297241, 167.0, 23.0 ],
					"text" : "match /pod12/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-296",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1800.0, 468.951219320297241, 167.0, 23.0 ],
					"text" : "match /pod12/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-297",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1770.0, 438.951219320297241, 147.0, 23.0 ],
					"text" : "match /pod12/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-298",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1590.0, 558.951219320297241, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-299",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1560.0, 525.951219320297241, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-300",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1530.0, 468.951219320297241, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-301",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1590.0, 498.951219320297241, 167.0, 23.0 ],
					"text" : "match /pod11/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-302",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1560.0, 468.951219320297241, 167.0, 23.0 ],
					"text" : "match /pod11/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-303",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1530.0, 438.951219320297241, 147.0, 23.0 ],
					"text" : "match /pod11/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-304",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1350.0, 558.951219320297241, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-305",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1320.0, 525.951219320297241, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-306",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1290.0, 468.951219320297241, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-307",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.0, 498.951219320297241, 167.0, 23.0 ],
					"text" : "match /pod10/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-308",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 468.951219320297241, 167.0, 23.0 ],
					"text" : "match /pod10/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-309",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1290.0, 438.951219320297241, 147.0, 23.0 ],
					"text" : "match /pod10/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-310",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1110.0, 558.951219320297241, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-311",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1080.0, 525.951219320297241, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-312",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1050.0, 468.951219320297241, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-313",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1110.0, 498.951219320297241, 167.0, 23.0 ],
					"text" : "match /pod09/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-314",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1080.0, 468.951219320297241, 167.0, 23.0 ],
					"text" : "match /pod09/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-315",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1050.0, 438.951219320297241, 147.0, 23.0 ],
					"text" : "match /pod09/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-268",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1830.0, 382.16260153055191, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-269",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1800.0, 349.16260153055191, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-270",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1770.0, 292.16260153055191, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-271",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1830.0, 322.16260153055191, 167.0, 23.0 ],
					"text" : "match /pod08/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-272",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1800.0, 292.16260153055191, 167.0, 23.0 ],
					"text" : "match /pod08/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-273",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1770.0, 262.16260153055191, 147.0, 23.0 ],
					"text" : "match /pod08/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-274",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1590.0, 382.16260153055191, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-275",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1560.0, 349.16260153055191, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-276",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1530.0, 292.16260153055191, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-277",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1590.0, 322.16260153055191, 167.0, 23.0 ],
					"text" : "match /pod07/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-278",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1560.0, 292.16260153055191, 167.0, 23.0 ],
					"text" : "match /pod07/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-279",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1530.0, 262.16260153055191, 147.0, 23.0 ],
					"text" : "match /pod07/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-280",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1350.0, 382.16260153055191, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-281",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1320.0, 349.16260153055191, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-282",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1290.0, 292.16260153055191, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-283",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.0, 322.16260153055191, 167.0, 23.0 ],
					"text" : "match /pod06/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-284",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 292.16260153055191, 167.0, 23.0 ],
					"text" : "match /pod06/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-285",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1290.0, 262.16260153055191, 147.0, 23.0 ],
					"text" : "match /pod06/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-286",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1110.0, 382.16260153055191, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-287",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1080.0, 349.16260153055191, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-288",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1050.0, 292.16260153055191, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-289",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1110.0, 322.16260153055191, 167.0, 23.0 ],
					"text" : "match /pod05/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-290",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1080.0, 292.16260153055191, 167.0, 23.0 ],
					"text" : "match /pod05/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-291",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1050.0, 262.16260153055191, 147.0, 23.0 ],
					"text" : "match /pod05/xy bang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-265",
					"justification" : 1,
					"linecolor" : [ 0.686274509803922, 0.686274509803922, 0.686274509803922, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 557.967479467391968, 700.520325243473053, 6.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 557.967479467391968, 700.520325243473053, 6.0 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-264",
					"justification" : 1,
					"linecolor" : [ 0.686274509803922, 0.686274509803922, 0.686274509803922, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 403.130081176757812, 700.520325243473053, 5.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 403.130081176757812, 700.520325243473053, 5.0 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-263",
					"justification" : 1,
					"linecolor" : [ 0.686274509803922, 0.686274509803922, 0.686274509803922, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 248.292682886123657, 700.520325243473053, 5.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 248.292682886123657, 700.520325243473053, 5.0 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-261",
					"justification" : 1,
					"linecolor" : [ 0.686274509803922, 0.686274509803922, 0.686274509803922, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 232.146341860294342, 165.0, 5.0, 478.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.146341860294342, 165.0, 5.0, 478.0 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-260",
					"justification" : 1,
					"linecolor" : [ 0.686274509803922, 0.686274509803922, 0.686274509803922, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 457.0, 165.0, 7.235772609710693, 478.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 457.5, 165.0, 6.735772609710693, 478.0 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-259",
					"justification" : 1,
					"linecolor" : [ 0.686274509803922, 0.686274509803922, 0.686274509803922, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 684.260162711143494, 165.0, 5.0, 478.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 683.260162711143494, 165.0, 6.0, 478.0 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"hidden" : 1,
					"id" : "obj-258",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 92.5, 1393.191037595272064, 45.0, 23.0 ],
					"text" : "close"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"hidden" : 1,
					"id" : "obj-256",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 28.5, 1432.215427815914154, 66.0, 23.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-253",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 41.0, 84.0, 1191.0, 713.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-18",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 60.0, 383.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-16",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 49.0, 338.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 14.0, 338.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"patching_rect" : [ 60.0, 259.0, 86.0, 22.0 ],
									"text" : "unpack sym 0."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"patching_rect" : [ 37.0, 218.0, 86.0, 22.0 ],
									"text" : "unpack sym 0."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 60.0, 170.0, 135.0, 22.0 ],
									"text" : "match /pod01/accl_y nn"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 37.0, 140.0, 135.0, 22.0 ],
									"text" : "match /pod01/accl_x nn"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 15.0, 109.0, 127.0, 22.0 ],
									"text" : "match /pod01/xy bang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 15.0, 20.0, 133.0, 22.0 ],
									"text" : "udpreceive 8744 cnmat"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1373.0, 20.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Monaco",
									"id" : "obj-6",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 570.0, 720.0, 45.0, 23.0 ],
									"text" : "close"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"index" : 4,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 570.0, 765.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-3",
									"index" : 3,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 456.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 89.0, 456.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 14.0, 456.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"source" : [ "obj-12", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 28.5, 1468.999981164932251, 73.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p example"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-252",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 28.5, 1393.191037595272064, 38.0, 23.0 ],
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 16.0,
					"id" : "obj-250",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 690.0, 847.567072987556458, 160.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 691.0, 845.90040647983551, 160.0, 26.0 ],
					"text" : "Blinks when bumped",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ],
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-249",
					"justification" : 1,
					"linecolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 853.0, 668.032520323991776, 5.0, 191.467479676008224 ],
					"presentation" : 1,
					"presentation_rect" : [ 853.0, 668.032520323991776, 5.0, 191.467479676008224 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 16.0,
					"id" : "obj-247",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 753.68292635679245, 779.745258629322052, 52.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 751.696137636899948, 772.300813019275665, 52.0, 26.0 ],
					"text" : "X-axis",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ],
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-246",
					"justification" : 1,
					"linecolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 807.68292635679245, 709.0, 5.0, 80.840109646320343 ],
					"presentation" : 1,
					"presentation_rect" : [ 805.696137636899948, 709.0, 6.986788719892502, 76.300813019275665 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 16.0,
					"id" : "obj-245",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 677.894308507442474, 727.528454840183258, 52.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 677.894308507442474, 726.142276436090469, 52.0, 26.0 ],
					"text" : "Y-axis",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ],
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-242",
					"justification" : 1,
					"linecolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 730.894308507442474, 645.902439028024673, 5.0, 91.869918704032898 ],
					"presentation" : 1,
					"presentation_rect" : [ 730.894308507442474, 645.902439028024673, 5.0, 91.869918704032898 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"id" : "obj-234",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 347.0, 1229.5, 48.0, 21.0 ],
					"text" : "Backup",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"id" : "obj-233",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 122.0, 1229.5, 48.0, 21.0 ],
					"text" : "Backup",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 16.0,
					"hidden" : 1,
					"id" : "obj-231",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 28.5, 1352.499981164932251, 165.0, 30.0 ],
					"text" : "How does it work?",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-219",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1830.0, 207.0, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-220",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1800.0, 174.0, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-221",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1770.0, 117.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-222",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1830.0, 147.0, 167.0, 23.0 ],
					"text" : "match /pod04/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-223",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1800.0, 117.0, 167.0, 23.0 ],
					"text" : "match /pod04/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-224",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1770.0, 87.0, 147.0, 23.0 ],
					"text" : "match /pod04/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-213",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1590.0, 207.0, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-214",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1560.0, 174.0, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-215",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1530.0, 117.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-216",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1590.0, 147.0, 167.0, 23.0 ],
					"text" : "match /pod03/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-217",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1560.0, 117.0, 167.0, 23.0 ],
					"text" : "match /pod03/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-218",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1530.0, 87.0, 147.0, 23.0 ],
					"text" : "match /pod03/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-207",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1350.0, 207.0, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-208",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1320.0, 174.0, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-209",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1290.0, 117.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-210",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.0, 147.0, 167.0, 23.0 ],
					"text" : "match /pod02/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-211",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 117.0, 167.0, 23.0 ],
					"text" : "match /pod02/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-212",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1290.0, 87.0, 147.0, 23.0 ],
					"text" : "match /pod02/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-206",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1110.0, 207.0, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-205",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 1080.0, 174.0, 102.0, 23.0 ],
					"text" : "unpack sym 0."
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-202",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1050.0, 117.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-189",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1110.0, 147.0, 167.0, 23.0 ],
					"text" : "match /pod01/accl_y nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-188",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1080.0, 117.0, 167.0, 23.0 ],
					"text" : "match /pod01/accl_x nn"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Menlo",
					"hidden" : 1,
					"id" : "obj-187",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1050.0, 87.0, 147.0, 23.0 ],
					"text" : "match /pod01/xy bang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Monaco",
					"hidden" : 1,
					"id" : "obj-186",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1050.0, 20.97560977935791, 160.0, 23.0 ],
					"text" : "udpreceive 8744 cnmat"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-178",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.0, 1191.5, 52.0, 50.0 ],
					"text" : "18",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-179",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 310.5, 1156.0, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-180",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 342.0, 1266.5, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-181",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 265.5, 1202.5, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-182",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 1191.5, 52.0, 50.0 ],
					"text" : "17",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-183",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 85.5, 1156.0, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-184",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 117.0, 1266.5, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-185",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.5, 1202.5, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-146",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 795.0, 604.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 795.0, 604.0, 52.0, 50.0 ],
					"text" : "16",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-147",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 760.5, 568.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 760.5, 568.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-148",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 792.0, 679.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 792.0, 679.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-149",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 715.5, 615.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 715.5, 615.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-150",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 570.0, 604.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 570.0, 604.0, 52.0, 50.0 ],
					"text" : "15",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-151",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 535.5, 568.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 535.5, 568.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-152",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 567.0, 679.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 567.0, 679.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-153",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 490.5, 615.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 490.5, 615.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-154",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.0, 604.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.0, 604.0, 52.0, 50.0 ],
					"text" : "14",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-155",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 310.5, 568.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.5, 568.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-156",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 342.0, 679.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 342.0, 679.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-157",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 265.5, 615.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 265.5, 615.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-158",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 604.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 604.0, 52.0, 50.0 ],
					"text" : "13",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-159",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 85.5, 568.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 85.5, 568.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-160",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 117.0, 679.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 117.0, 679.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-161",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.5, 615.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.5, 615.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-162",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 795.0, 450.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 795.0, 450.0, 52.0, 50.0 ],
					"text" : "12",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-163",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 760.5, 414.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 760.5, 414.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-164",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 792.0, 525.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 792.0, 525.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-165",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 715.5, 461.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 715.5, 461.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-166",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 570.0, 450.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 570.0, 450.0, 52.0, 50.0 ],
					"text" : "11",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-167",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 535.5, 414.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 535.5, 414.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-168",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 567.0, 525.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 567.0, 525.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-169",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 490.5, 461.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 490.5, 461.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-170",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.0, 450.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.0, 450.0, 52.0, 50.0 ],
					"text" : "10",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-171",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 310.5, 414.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.5, 414.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-172",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 342.0, 525.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 342.0, 525.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-173",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 265.5, 461.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 265.5, 461.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-174",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 450.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 450.0, 52.0, 50.0 ],
					"text" : "9",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-175",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 85.5, 414.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 85.5, 414.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-176",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 117.0, 525.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 117.0, 525.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-177",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.5, 461.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.5, 461.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-130",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 795.0, 295.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 795.0, 295.0, 52.0, 50.0 ],
					"text" : "8",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-131",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 760.5, 259.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 760.5, 259.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-132",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 792.0, 370.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 792.0, 370.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-133",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 715.5, 306.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 715.5, 306.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-134",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 570.0, 295.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 570.0, 295.0, 52.0, 50.0 ],
					"text" : "7",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-135",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 535.5, 259.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 535.5, 259.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-136",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 567.0, 370.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 567.0, 370.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-137",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 490.5, 306.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 490.5, 306.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-138",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.0, 295.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.0, 295.0, 52.0, 50.0 ],
					"text" : "6",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-139",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 310.5, 259.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.5, 259.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-140",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 342.0, 370.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 342.0, 370.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-141",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 265.5, 306.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 265.5, 306.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-142",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 295.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 295.0, 52.0, 50.0 ],
					"text" : "5",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-143",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 85.5, 259.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 85.5, 259.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-144",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 117.0, 370.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 117.0, 370.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-145",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.5, 306.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.5, 306.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-46",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 795.0, 141.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 795.0, 141.0, 52.0, 50.0 ],
					"text" : "4",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-47",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 760.5, 105.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 760.5, 105.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-48",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 792.0, 216.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 792.0, 216.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-49",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 715.5, 152.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 715.5, 152.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-42",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 570.0, 141.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 570.0, 141.0, 52.0, 50.0 ],
					"text" : "3",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-43",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 535.5, 105.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 535.5, 105.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-44",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 567.0, 216.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 567.0, 216.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-45",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 490.5, 152.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 490.5, 152.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-38",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.0, 141.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 345.0, 141.0, 52.0, 50.0 ],
					"text" : "2",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-39",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 310.5, 105.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.5, 105.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-40",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 342.0, 216.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 342.0, 216.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-41",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 265.5, 152.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 265.5, 152.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-31",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 141.0, 52.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 141.0, 52.0, 50.0 ],
					"text" : "1",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"blinktime" : 350,
					"id" : "obj-27",
					"ignoreclick" : 1,
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.72156862745098, 0.72156862745098, 0.72156862745098, 1.0 ],
					"oncolor" : [ 0.0, 1.0, 0.619607843137255, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 85.5, 105.5, 121.0, 121.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 85.5, 105.5, 121.0, 121.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-9",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 117.0, 216.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 117.0, 216.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"format" : 6,
					"id" : "obj-6",
					"ignoreclick" : 1,
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.5, 152.0, 58.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.5, 152.0, 58.0, 28.0 ],
					"style" : "text",
					"textcolor" : [ 0.333333333333333, 0.333333333333333, 0.333333333333333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Bold",
					"fontsize" : 36.0,
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 225.0, 15.0, 471.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 225.0, 15.0, 471.0, 50.0 ],
					"text" : "Celestial Garden at a Glance"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.831372549019608, 0.831372549019608, 0.831372549019608, 1.0 ],
					"id" : "obj-235",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 28.5, 1156.0, 435.735772609710693, 152.5 ],
					"proportion" : 0.5
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"hidden" : 1,
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-202", 0 ],
					"hidden" : 1,
					"source" : [ "obj-187", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-205", 0 ],
					"hidden" : 1,
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 0 ],
					"hidden" : 1,
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"hidden" : 1,
					"source" : [ "obj-202", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"hidden" : 1,
					"source" : [ "obj-205", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"hidden" : 1,
					"source" : [ "obj-206", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"hidden" : 1,
					"source" : [ "obj-207", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"hidden" : 1,
					"source" : [ "obj-208", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"hidden" : 1,
					"source" : [ "obj-209", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-207", 0 ],
					"hidden" : 1,
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-208", 0 ],
					"hidden" : 1,
					"source" : [ "obj-211", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-209", 0 ],
					"hidden" : 1,
					"source" : [ "obj-212", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"hidden" : 1,
					"source" : [ "obj-213", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"hidden" : 1,
					"source" : [ "obj-214", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"hidden" : 1,
					"source" : [ "obj-215", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-213", 0 ],
					"hidden" : 1,
					"source" : [ "obj-216", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-214", 0 ],
					"hidden" : 1,
					"source" : [ "obj-217", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-215", 0 ],
					"hidden" : 1,
					"source" : [ "obj-218", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"hidden" : 1,
					"source" : [ "obj-219", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"hidden" : 1,
					"source" : [ "obj-220", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"hidden" : 1,
					"source" : [ "obj-221", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-219", 0 ],
					"hidden" : 1,
					"source" : [ "obj-222", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-220", 0 ],
					"hidden" : 1,
					"source" : [ "obj-223", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"hidden" : 1,
					"source" : [ "obj-224", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 0 ],
					"hidden" : 1,
					"source" : [ "obj-231", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-256", 0 ],
					"hidden" : 1,
					"source" : [ "obj-252", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-258", 0 ],
					"hidden" : 1,
					"source" : [ "obj-253", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-253", 0 ],
					"hidden" : 1,
					"source" : [ "obj-256", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-256", 0 ],
					"hidden" : 1,
					"source" : [ "obj-258", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"hidden" : 1,
					"source" : [ "obj-268", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"hidden" : 1,
					"source" : [ "obj-269", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"hidden" : 1,
					"source" : [ "obj-270", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-268", 0 ],
					"hidden" : 1,
					"source" : [ "obj-271", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-269", 0 ],
					"hidden" : 1,
					"source" : [ "obj-272", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-270", 0 ],
					"hidden" : 1,
					"source" : [ "obj-273", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"hidden" : 1,
					"source" : [ "obj-274", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"hidden" : 1,
					"source" : [ "obj-275", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"hidden" : 1,
					"source" : [ "obj-276", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-274", 0 ],
					"hidden" : 1,
					"source" : [ "obj-277", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-275", 0 ],
					"hidden" : 1,
					"source" : [ "obj-278", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-276", 0 ],
					"hidden" : 1,
					"source" : [ "obj-279", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"hidden" : 1,
					"source" : [ "obj-280", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"hidden" : 1,
					"source" : [ "obj-281", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"hidden" : 1,
					"source" : [ "obj-282", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-280", 0 ],
					"hidden" : 1,
					"source" : [ "obj-283", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-281", 0 ],
					"hidden" : 1,
					"source" : [ "obj-284", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-282", 0 ],
					"hidden" : 1,
					"source" : [ "obj-285", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 0 ],
					"hidden" : 1,
					"source" : [ "obj-286", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"hidden" : 1,
					"source" : [ "obj-287", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 0 ],
					"hidden" : 1,
					"source" : [ "obj-288", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-286", 0 ],
					"hidden" : 1,
					"source" : [ "obj-289", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-287", 0 ],
					"hidden" : 1,
					"source" : [ "obj-290", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-288", 0 ],
					"hidden" : 1,
					"source" : [ "obj-291", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-165", 0 ],
					"hidden" : 1,
					"source" : [ "obj-292", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-164", 0 ],
					"hidden" : 1,
					"source" : [ "obj-293", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-163", 0 ],
					"hidden" : 1,
					"source" : [ "obj-294", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-292", 0 ],
					"hidden" : 1,
					"source" : [ "obj-295", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-293", 0 ],
					"hidden" : 1,
					"source" : [ "obj-296", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-294", 0 ],
					"hidden" : 1,
					"source" : [ "obj-297", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"source" : [ "obj-298", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-168", 0 ],
					"hidden" : 1,
					"source" : [ "obj-299", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-187", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 78.0, 1059.5, 78.0 ],
					"order" : 53,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1047.0, 72.0, 1047.0, 111.0, 1089.5, 111.0 ],
					"order" : 48,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-189", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 153.0, 1107.0, 153.0, 1107.0, 144.0, 1119.5, 144.0 ],
					"order" : 43,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-210", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1275.0, 72.0, 1275.0, 141.0, 1359.5, 141.0 ],
					"order" : 28,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-211", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1275.0, 72.0, 1275.0, 111.0, 1329.5, 111.0 ],
					"order" : 33,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-212", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1299.5, 72.0 ],
					"order" : 38,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-216", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1515.0, 72.0, 1515.0, 141.0, 1599.5, 141.0 ],
					"order" : 15,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-217", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1515.0, 72.0, 1515.0, 111.0, 1569.5, 111.0 ],
					"order" : 19,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1539.5, 72.0 ],
					"order" : 23,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-222", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1755.0, 72.0, 1755.0, 141.0, 1839.5, 141.0 ],
					"order" : 3,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1755.0, 72.0, 1755.0, 111.0, 1809.5, 111.0 ],
					"order" : 7,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-224", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1779.5, 72.0 ],
					"order" : 11,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-271", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1515.0, 72.0, 1515.0, 144.0, 1527.0, 144.0, 1527.0, 249.0, 1755.0, 249.0, 1755.0, 318.0, 1839.5, 318.0 ],
					"order" : 2,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-272", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1515.0, 72.0, 1515.0, 144.0, 1527.0, 144.0, 1527.0, 249.0, 1755.0, 249.0, 1755.0, 288.0, 1809.5, 288.0 ],
					"order" : 6,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-273", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1755.0, 72.0, 1755.0, 144.0, 1767.0, 144.0, 1767.0, 249.0, 1779.5, 249.0 ],
					"order" : 10,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-277", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1275.0, 72.0, 1275.0, 144.0, 1287.0, 144.0, 1287.0, 249.0, 1515.0, 249.0, 1515.0, 318.0, 1599.5, 318.0 ],
					"order" : 14,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-278", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1275.0, 72.0, 1275.0, 144.0, 1287.0, 144.0, 1287.0, 249.0, 1515.0, 249.0, 1515.0, 288.0, 1569.5, 288.0 ],
					"order" : 18,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-279", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1515.0, 72.0, 1515.0, 144.0, 1527.0, 144.0, 1527.0, 249.0, 1539.5, 249.0 ],
					"order" : 22,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-283", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 249.0, 1275.0, 249.0, 1275.0, 318.0, 1359.5, 318.0 ],
					"order" : 27,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-284", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 249.0, 1275.0, 249.0, 1275.0, 288.0, 1329.5, 288.0 ],
					"order" : 32,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-285", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1275.0, 72.0, 1275.0, 144.0, 1287.0, 144.0, 1287.0, 249.0, 1299.5, 249.0 ],
					"order" : 37,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-289", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 327.0, 1107.0, 327.0, 1107.0, 318.0, 1119.5, 318.0 ],
					"order" : 42,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-290", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 288.0, 1089.5, 288.0 ],
					"order" : 47,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-291", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 249.0, 1059.5, 249.0 ],
					"order" : 52,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-295", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1755.0, 423.0, 1755.0, 492.0, 1839.5, 492.0 ],
					"order" : 1,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-296", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1755.0, 423.0, 1755.0, 462.0, 1809.5, 462.0 ],
					"order" : 5,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-297", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1779.5, 423.0 ],
					"order" : 9,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-301", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1515.0, 423.0, 1515.0, 492.0, 1599.5, 492.0 ],
					"order" : 13,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-302", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1515.0, 423.0, 1515.0, 462.0, 1569.5, 462.0 ],
					"order" : 17,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-303", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1539.5, 423.0 ],
					"order" : 21,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-307", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1275.0, 423.0, 1275.0, 492.0, 1359.5, 492.0 ],
					"order" : 26,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-308", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1275.0, 423.0, 1275.0, 462.0, 1329.5, 462.0 ],
					"order" : 31,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-309", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1299.5, 423.0 ],
					"order" : 36,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-313", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 504.0, 1107.0, 504.0, 1107.0, 495.0, 1119.5, 495.0 ],
					"order" : 41,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-314", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 462.0, 1089.5, 462.0 ],
					"order" : 46,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-315", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 423.0, 1059.5, 423.0 ],
					"order" : 51,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-319", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1755.0, 597.0, 1755.0, 666.0, 1839.5, 666.0 ],
					"order" : 0,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-320", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1755.0, 597.0, 1755.0, 636.0, 1809.5, 636.0 ],
					"order" : 4,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-321", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1779.5, 597.0 ],
					"order" : 8,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-325", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1515.0, 597.0, 1515.0, 666.0, 1599.5, 666.0 ],
					"order" : 12,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-326", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1515.0, 597.0, 1515.0, 636.0, 1569.5, 636.0 ],
					"order" : 16,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-327", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1539.5, 597.0 ],
					"order" : 20,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-331", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1275.0, 597.0, 1275.0, 666.0, 1359.5, 666.0 ],
					"order" : 25,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-332", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1275.0, 597.0, 1275.0, 636.0, 1329.5, 636.0 ],
					"order" : 30,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-333", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1299.5, 597.0 ],
					"order" : 35,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-337", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 675.0, 1107.0, 675.0, 1107.0, 666.0, 1119.5, 666.0 ],
					"order" : 40,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-338", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 636.0, 1089.5, 636.0 ],
					"order" : 45,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-339", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 597.0, 1059.5, 597.0 ],
					"order" : 50,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-343", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 768.0, 1275.0, 768.0, 1275.0, 837.0, 1359.5, 837.0 ],
					"order" : 24,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-344", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 768.0, 1275.0, 768.0, 1275.0, 807.0, 1329.5, 807.0 ],
					"order" : 29,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-345", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 768.0, 1299.5, 768.0 ],
					"order" : 34,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-349", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 846.0, 1107.0, 846.0, 1107.0, 837.0, 1119.5, 837.0 ],
					"order" : 39,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-350", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 807.0, 1089.5, 807.0 ],
					"order" : 44,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-351", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1825.5, 72.0, 1035.0, 72.0, 1035.0, 768.0, 1059.5, 768.0 ],
					"order" : 49,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 0 ],
					"hidden" : 1,
					"source" : [ "obj-300", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-298", 0 ],
					"hidden" : 1,
					"source" : [ "obj-301", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-299", 0 ],
					"hidden" : 1,
					"source" : [ "obj-302", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-300", 0 ],
					"hidden" : 1,
					"source" : [ "obj-303", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-173", 0 ],
					"hidden" : 1,
					"source" : [ "obj-304", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-172", 0 ],
					"hidden" : 1,
					"source" : [ "obj-305", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-171", 0 ],
					"hidden" : 1,
					"source" : [ "obj-306", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-304", 0 ],
					"hidden" : 1,
					"source" : [ "obj-307", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-305", 0 ],
					"hidden" : 1,
					"source" : [ "obj-308", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-306", 0 ],
					"hidden" : 1,
					"source" : [ "obj-309", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-177", 0 ],
					"hidden" : 1,
					"source" : [ "obj-310", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-176", 0 ],
					"hidden" : 1,
					"source" : [ "obj-311", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"hidden" : 1,
					"source" : [ "obj-312", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-310", 0 ],
					"hidden" : 1,
					"source" : [ "obj-313", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-311", 0 ],
					"hidden" : 1,
					"source" : [ "obj-314", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-312", 0 ],
					"hidden" : 1,
					"source" : [ "obj-315", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"hidden" : 1,
					"source" : [ "obj-316", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-148", 0 ],
					"hidden" : 1,
					"source" : [ "obj-317", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"hidden" : 1,
					"source" : [ "obj-318", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-316", 0 ],
					"hidden" : 1,
					"source" : [ "obj-319", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-317", 0 ],
					"hidden" : 1,
					"source" : [ "obj-320", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-318", 0 ],
					"hidden" : 1,
					"source" : [ "obj-321", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"hidden" : 1,
					"source" : [ "obj-322", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-152", 0 ],
					"hidden" : 1,
					"source" : [ "obj-323", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-151", 0 ],
					"hidden" : 1,
					"source" : [ "obj-324", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-322", 0 ],
					"hidden" : 1,
					"source" : [ "obj-325", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-323", 0 ],
					"hidden" : 1,
					"source" : [ "obj-326", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-324", 0 ],
					"hidden" : 1,
					"source" : [ "obj-327", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-157", 0 ],
					"hidden" : 1,
					"source" : [ "obj-328", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 0 ],
					"hidden" : 1,
					"source" : [ "obj-329", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-155", 0 ],
					"hidden" : 1,
					"source" : [ "obj-330", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-328", 0 ],
					"hidden" : 1,
					"source" : [ "obj-331", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-329", 0 ],
					"hidden" : 1,
					"source" : [ "obj-332", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-330", 0 ],
					"hidden" : 1,
					"source" : [ "obj-333", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"hidden" : 1,
					"source" : [ "obj-334", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 0 ],
					"hidden" : 1,
					"source" : [ "obj-335", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"hidden" : 1,
					"source" : [ "obj-336", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-334", 0 ],
					"hidden" : 1,
					"source" : [ "obj-337", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-335", 0 ],
					"hidden" : 1,
					"source" : [ "obj-338", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-336", 0 ],
					"hidden" : 1,
					"source" : [ "obj-339", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"hidden" : 1,
					"source" : [ "obj-340", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-180", 0 ],
					"hidden" : 1,
					"source" : [ "obj-341", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-179", 0 ],
					"hidden" : 1,
					"source" : [ "obj-342", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-340", 0 ],
					"hidden" : 1,
					"source" : [ "obj-343", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-341", 0 ],
					"hidden" : 1,
					"source" : [ "obj-344", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-342", 0 ],
					"hidden" : 1,
					"source" : [ "obj-345", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-185", 0 ],
					"hidden" : 1,
					"source" : [ "obj-346", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 0 ],
					"hidden" : 1,
					"source" : [ "obj-347", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-183", 0 ],
					"hidden" : 1,
					"source" : [ "obj-348", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-346", 0 ],
					"hidden" : 1,
					"source" : [ "obj-349", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-347", 0 ],
					"hidden" : 1,
					"source" : [ "obj-350", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-348", 0 ],
					"hidden" : 1,
					"source" : [ "obj-351", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "OpenSoundControl.mxe64",
				"type" : "mx64"
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "text",
				"default" : 				{
					"fontname" : [ "Ableton Sans Medium" ],
					"fontsize" : [ 16.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
