

using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Effects;
using System.Windows.Media.Media3D;


namespace SparklyThings.Shaders {
	
	public class SparklyThings : ShaderEffect {
		public static readonly DependencyProperty InputProperty = ShaderEffect.RegisterPixelShaderSamplerProperty("Input", typeof(SparklyThings), 0);
		public static readonly DependencyProperty TimeProperty = DependencyProperty.Register("Time", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(1D)), PixelShaderConstantCallback(0)));
		public static readonly DependencyProperty ResolutionXProperty = DependencyProperty.Register("ResolutionX", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(1280D)), PixelShaderConstantCallback(1)));
		public static readonly DependencyProperty ResolutionYProperty = DependencyProperty.Register("ResolutionY", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(1024D)), PixelShaderConstantCallback(2)));
		public static readonly DependencyProperty DirectionProperty = DependencyProperty.Register("Direction", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(3)));
		public static readonly DependencyProperty UpDownReverseProperty = DependencyProperty.Register("UpDownReverse", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(4)));
		public static readonly DependencyProperty ImgHueProperty = DependencyProperty.Register("ImgHue", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(5)));
		public static readonly DependencyProperty ImgSatProperty = DependencyProperty.Register("ImgSat", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(1D)), PixelShaderConstantCallback(6)));
		public static readonly DependencyProperty ImgLumProperty = DependencyProperty.Register("ImgLum", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(7)));
		public static readonly DependencyProperty EffHueProperty = DependencyProperty.Register("EffHue", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(8)));
		public static readonly DependencyProperty EffSatProperty = DependencyProperty.Register("EffSat", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(1D)), PixelShaderConstantCallback(9)));
		public static readonly DependencyProperty EffLumProperty = DependencyProperty.Register("EffLum", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(10)));
		public static readonly DependencyProperty EffColor1Property = DependencyProperty.Register("EffColor1", typeof(Color), typeof(SparklyThings), new UIPropertyMetadata(Color.FromArgb(255, 255, 0, 0), PixelShaderConstantCallback(11)));
		public static readonly DependencyProperty EffColor2Property = DependencyProperty.Register("EffColor2", typeof(Color), typeof(SparklyThings), new UIPropertyMetadata(Color.FromArgb(255, 0, 0, 153), PixelShaderConstantCallback(12)));
		public static readonly DependencyProperty AlphaProperty = DependencyProperty.Register("Alpha", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(1D)), PixelShaderConstantCallback(13)));
		public static readonly DependencyProperty AlphaModeProperty = DependencyProperty.Register("AlphaMode", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(14)));
		public static readonly DependencyProperty ImgGrayFilterProperty = DependencyProperty.Register("ImgGrayFilter", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(15)));
		public static readonly DependencyProperty ImgFilterColorProperty = DependencyProperty.Register("ImgFilterColor", typeof(Color), typeof(SparklyThings), new UIPropertyMetadata(Color.FromArgb(255, 0, 0, 0), PixelShaderConstantCallback(16)));
		public static readonly DependencyProperty ImgDirectionProperty = DependencyProperty.Register("ImgDirection", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(17)));
		public static readonly DependencyProperty ImgUpDownReverseProperty = DependencyProperty.Register("ImgUpDownReverse", typeof(double), typeof(SparklyThings), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(18)));
		public static readonly DependencyProperty EffColor3Property = DependencyProperty.Register("EffColor3", typeof(Color), typeof(SparklyThings), new UIPropertyMetadata(Color.FromArgb(255, 0, 153, 0), PixelShaderConstantCallback(19)));
		public SparklyThings() {
			PixelShader pixelShader = new PixelShader();
			pixelShader.UriSource = new Uri("/SparklyThings.Shaders;component/SparklyThings.ps", UriKind.Relative);
			this.PixelShader = pixelShader;

			this.UpdateShaderValue(InputProperty);
			this.UpdateShaderValue(TimeProperty);
			this.UpdateShaderValue(ResolutionXProperty);
			this.UpdateShaderValue(ResolutionYProperty);
			this.UpdateShaderValue(DirectionProperty);
			this.UpdateShaderValue(UpDownReverseProperty);
			this.UpdateShaderValue(ImgHueProperty);
			this.UpdateShaderValue(ImgSatProperty);
			this.UpdateShaderValue(ImgLumProperty);
			this.UpdateShaderValue(EffHueProperty);
			this.UpdateShaderValue(EffSatProperty);
			this.UpdateShaderValue(EffLumProperty);
			this.UpdateShaderValue(EffColor1Property);
			this.UpdateShaderValue(EffColor2Property);
			this.UpdateShaderValue(AlphaProperty);
			this.UpdateShaderValue(AlphaModeProperty);
			this.UpdateShaderValue(ImgGrayFilterProperty);
			this.UpdateShaderValue(ImgFilterColorProperty);
			this.UpdateShaderValue(ImgDirectionProperty);
			this.UpdateShaderValue(ImgUpDownReverseProperty);
			this.UpdateShaderValue(EffColor3Property);
		}
		public Brush Input {
			get {
				return ((Brush)(this.GetValue(InputProperty)));
			}
			set {
				this.SetValue(InputProperty, value);
			}
		}
		/// <summary>iTime.</summary>
		public double Time {
			get {
				return ((double)(this.GetValue(TimeProperty)));
			}
			set {
				this.SetValue(TimeProperty, value);
			}
		}
		/// <summary>resolutionX.</summary>
		public double ResolutionX {
			get {
				return ((double)(this.GetValue(ResolutionXProperty)));
			}
			set {
				this.SetValue(ResolutionXProperty, value);
			}
		}
		/// <summary>resolutionY.</summary>
		public double ResolutionY {
			get {
				return ((double)(this.GetValue(ResolutionYProperty)));
			}
			set {
				this.SetValue(ResolutionYProperty, value);
			}
		}
		/// <summary>direction.</summary>
		public double Direction {
			get {
				return ((double)(this.GetValue(DirectionProperty)));
			}
			set {
				this.SetValue(DirectionProperty, value);
			}
		}
		/// <summary>UpDownReverse.</summary>
		public double UpDownReverse {
			get {
				return ((double)(this.GetValue(UpDownReverseProperty)));
			}
			set {
				this.SetValue(UpDownReverseProperty, value);
			}
		}
		/// <summary>ImgHue.</summary>
		public double ImgHue {
			get {
				return ((double)(this.GetValue(ImgHueProperty)));
			}
			set {
				this.SetValue(ImgHueProperty, value);
			}
		}
		/// <summary>ImgSat.</summary>
		public double ImgSat {
			get {
				return ((double)(this.GetValue(ImgSatProperty)));
			}
			set {
				this.SetValue(ImgSatProperty, value);
			}
		}
		/// <summary>ImgLum.</summary>
		public double ImgLum {
			get {
				return ((double)(this.GetValue(ImgLumProperty)));
			}
			set {
				this.SetValue(ImgLumProperty, value);
			}
		}
		/// <summary>EffHue.</summary>
		public double EffHue {
			get {
				return ((double)(this.GetValue(EffHueProperty)));
			}
			set {
				this.SetValue(EffHueProperty, value);
			}
		}
		/// <summary>EffSat.</summary>
		public double EffSat {
			get {
				return ((double)(this.GetValue(EffSatProperty)));
			}
			set {
				this.SetValue(EffSatProperty, value);
			}
		}
		/// <summary>EffLum.</summary>
		public double EffLum {
			get {
				return ((double)(this.GetValue(EffLumProperty)));
			}
			set {
				this.SetValue(EffLumProperty, value);
			}
		}
		public Color EffColor1 {
			get {
				return ((Color)(this.GetValue(EffColor1Property)));
			}
			set {
				this.SetValue(EffColor1Property, value);
			}
		}
		public Color EffColor2 {
			get {
				return ((Color)(this.GetValue(EffColor2Property)));
			}
			set {
				this.SetValue(EffColor2Property, value);
			}
		}
		/// <summary>The radius of the Poisson disk (in pixels).</summary>
		public double Alpha {
			get {
				return ((double)(this.GetValue(AlphaProperty)));
			}
			set {
				this.SetValue(AlphaProperty, value);
			}
		}
		/// <summary>alphaMode.</summary>
		public double AlphaMode {
			get {
				return ((double)(this.GetValue(AlphaModeProperty)));
			}
			set {
				this.SetValue(AlphaModeProperty, value);
			}
		}
		/// <summary>ImgGrayFilter.</summary>
		public double ImgGrayFilter {
			get {
				return ((double)(this.GetValue(ImgGrayFilterProperty)));
			}
			set {
				this.SetValue(ImgGrayFilterProperty, value);
			}
		}
		public Color ImgFilterColor {
			get {
				return ((Color)(this.GetValue(ImgFilterColorProperty)));
			}
			set {
				this.SetValue(ImgFilterColorProperty, value);
			}
		}
		/// <summary>imgDirection.</summary>
		public double ImgDirection {
			get {
				return ((double)(this.GetValue(ImgDirectionProperty)));
			}
			set {
				this.SetValue(ImgDirectionProperty, value);
			}
		}
		/// <summary>imgUpDownReverse.</summary>
		public double ImgUpDownReverse {
			get {
				return ((double)(this.GetValue(ImgUpDownReverseProperty)));
			}
			set {
				this.SetValue(ImgUpDownReverseProperty, value);
			}
		}
		public Color EffColor3 {
			get {
				return ((Color)(this.GetValue(EffColor3Property)));
			}
			set {
				this.SetValue(EffColor3Property, value);
			}
		}
	}
}
