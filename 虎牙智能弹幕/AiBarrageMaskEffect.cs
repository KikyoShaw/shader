using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Effects;


namespace Huya.VideoPlayer.Module.Barrage.Sharder
{
	public class AiBarrageMaskEffect : ShaderEffect {
		public static readonly DependencyProperty InputProperty = ShaderEffect.RegisterPixelShaderSamplerProperty("Input", typeof(AiBarrageMaskEffect), 0);
		public static readonly DependencyProperty IChannel1Property = ShaderEffect.RegisterPixelShaderSamplerProperty("IChannel1", typeof(AiBarrageMaskEffect), 1);
		public static readonly DependencyProperty SampleInputParamProperty = DependencyProperty.Register("SampleInputParam", typeof(double), typeof(AiBarrageMaskEffect), new UIPropertyMetadata(((double)(3.5D)), PixelShaderConstantCallback(0)));
		public AiBarrageMaskEffect() {
			PixelShader pixelShader = new PixelShader();
			pixelShader.UriSource = new Uri("pack://application:,,,/Huya.VideoPlayer;component/Module/Barrage/Shader/AiBarrageMaskEffect.ps");
			this.PixelShader = pixelShader;

			this.UpdateShaderValue(InputProperty);
			this.UpdateShaderValue(IChannel1Property);
			this.UpdateShaderValue(SampleInputParamProperty);
		}
		public Brush Input {
			get {
				return ((Brush)(this.GetValue(InputProperty)));
			}
			set {
				this.SetValue(InputProperty, value);
			}
		}
		public Brush IChannel1 {
			get {
				return ((Brush)(this.GetValue(IChannel1Property)));
			}
			set {
				this.SetValue(IChannel1Property, value);
			}
		}
		public double SampleInputParam {
			get {
				return ((double)(this.GetValue(SampleInputParamProperty)));
			}
			set {
				this.SetValue(SampleInputParamProperty, value);
			}
		}
	}
}
