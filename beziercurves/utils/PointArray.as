package beziercurves.utils {	import beziercurves.display.ControlPoint;	import beziercurves.display.AnchorPoint;	import flash.utils.getQualifiedSuperclassName;		/**	 * Copyright (c) 2008 nicolas levavasseur	 * @author nico	 */	public dynamic class PointArray extends Array {		public function PointArray(){			super();		}				public function export():void {			trace("//------- CURVE DEFINITION -------");			trace("var b:BezierCurve = new BezierCurve();");			for(var i:int = 0; i < length; i++){				switch( this[i].constructor ){					case AnchorPoint:						trace("b.addAnchor(" + this[i].x + ", " + this[i].y + ");");						break;					case ControlPoint:						trace("b.addControl(" + this[i].x + ", " + this[i].y + ");");						break;				}			}			trace("b.draw();");			trace("//--------------------------------");		}				public static function copy(array:Array):PointArray {			var a:PointArray = new PointArray();			for(var i:int = 0; i < array.length; i++){				a.push(array[i]);			}			return a;		}				AS3 override function push(... args):uint {			for each(var arg:Object in args){				if( getQualifiedSuperclassName(arg) !== "flash.geom::Point" ) {					throw new Error("one of the arguments is not valid, check types\n\tat beziercurves.utils::PointArray.push()");					return this.length;				}			}			return super.push.apply(null, args);		}	}}