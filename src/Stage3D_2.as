package
{
	import away3d.containers.*;
	import away3d.entities.*;
	import away3d.materials.*;
	import away3d.materials.methods.*;
	import away3d.primitives.*;
	
	import flash.events.*;
	import flash.geom.*;
	import flash.utils.*;
	
	[SWF(width="465", height="465", frameRate="60")]
	public class Stage3D_2 extends View3D
	{
		private var cubes:Vector.<CUBE>=new Vector.<CUBE>();
		
		public function Stage3D_2()
		{
			backgroundColor = 0xFFFFFF;
			
			for(var i:uint = 0; i<50; i++){
				var c:CUBE=new CUBE();
				cubes.push(c);
				scene.addChild(cubes[i].obj);
			}
			
			camera.z = -1300;
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void{
			
			for(var i:uint=0;i<cubes.length;i++){
				cubes[i].move();
			}
			render();
		}
	}
}


import away3d.entities.Mesh;
import away3d.materials.ColorMaterial;
import away3d.materials.methods.FogMethod;
import away3d.primitives.CubeGeometry;

class CUBE{
	public var obj:Mesh;
	private var vx:Number;
	private var vy:Number;
	private var vz:Number;
	
	public function CUBE(){
		var material:ColorMaterial = new ColorMaterial(0x0000FF);
		material.addMethod(new FogMethod(0, 2000, 0xFFFFFF));
		obj = new Mesh(new CubeGeometry(), material);
		
		obj.x = 1000 * (Math.random() - 0.5);
		obj.y = 1000 * (Math.random() - 0.5);
		obj.z = 1000 * (Math.random() - 0.5);
		
		vx = (Math.random() - 0.5) * 10;
		vy = (Math.random() - 0.5) * 10;
		vz = (Math.random() - 0.5) * 10;
	}
	
	public function move():void{
		obj.rotationX += vx;
		obj.rotationY += vy;
		obj.rotationZ += vz;
	} 
}







