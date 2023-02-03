
using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Effects;
using System.Windows.Media.Media3D;


namespace Fog2dEffect.SharderEffect {
	
	/// <summary>An effect that dims all but the brightest pixels.</summary>
	public class fog2dAlpha : ShaderEffect {
		public static readonly DependencyProperty InputProperty = ShaderEffect.RegisterPixelShaderSamplerProperty("Input", typeof(fog2dAlpha), 0);
		public static readonly DependencyProperty TimeProperty = DependencyProperty.Register("Time", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(1D)), PixelShaderConstantCallback(0)));
		public static readonly DependencyProperty ResolutionXProperty = DependencyProperty.Register("ResolutionX", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(1280D)), PixelShaderConstantCallback(1)));
		public static readonly DependencyProperty ResolutionYProperty = DependencyProperty.Register("ResolutionY", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(1024D)), PixelShaderConstantCallback(2)));
		public static readonly DependencyProperty DirectionProperty = DependencyProperty.Register("Direction", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(5)));
		public static readonly DependencyProperty UpDownReverseProperty = DependencyProperty.Register("UpDownReverse", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(6)));
		public static readonly DependencyProperty AlphaProperty = DependencyProperty.Register("Alpha", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(1D)), PixelShaderConstantCallback(7)));
		public static readonly DependencyProperty AlphaMarginHorProperty = DependencyProperty.Register("AlphaMarginHor", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(0.1D)), PixelShaderConstantCallback(8)));
		public static readonly DependencyProperty AlphaMarginVerProperty = DependencyProperty.Register("AlphaMarginVer", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(0.1D)), PixelShaderConstantCallback(9)));
		public static readonly DependencyProperty EffHueProperty = DependencyProperty.Register("EffHue", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(11)));
		public static readonly DependencyProperty EffSatProperty = DependencyProperty.Register("EffSat", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(1D)), PixelShaderConstantCallback(12)));
		public static readonly DependencyProperty EffLumProperty = DependencyProperty.Register("EffLum", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(0D)), PixelShaderConstantCallback(13)));
		public static readonly DependencyProperty FogColorProperty = DependencyProperty.Register("FogColor", typeof(Color), typeof(fog2dAlpha), new UIPropertyMetadata(Color.FromArgb(255, 255, 255, 255), PixelShaderConstantCallback(14)));
		public static readonly DependencyProperty OctavesNumProperty = DependencyProperty.Register("OctavesNum", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(6D)), PixelShaderConstantCallback(15)));
		public static readonly DependencyProperty ImgshakeProperty = DependencyProperty.Register("Imgshake", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(1D)), PixelShaderConstantCallback(20)));
		public static readonly DependencyProperty ImgshakeSpeedProperty = DependencyProperty.Register("ImgshakeSpeed", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(0.3D)), PixelShaderConstantCallback(21)));
		public static readonly DependencyProperty ImgshakeSizeProperty = DependencyProperty.Register("ImgshakeSize", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(10D)), PixelShaderConstantCallback(22)));
		public static readonly DependencyProperty ImgshakeRangeProperty = DependencyProperty.Register("ImgshakeRange", typeof(double), typeof(fog2dAlpha), new UIPropertyMetadata(((double)(8D)), PixelShaderConstantCallback(23)));
		public fog2dAlpha() {
			PixelShader pixelShader = new PixelShader();
			pixelShader.UriSource = new Uri("/Shazzam.Shaders;component/fog2dAlpha.ps", UriKind.Relative);
			this.PixelShader = pixelShader;

			this.UpdateShaderValue(InputProperty);
			this.UpdateShaderValue(TimeProperty);
			this.UpdateShaderValue(ResolutionXProperty);
			this.UpdateShaderValue(ResolutionYProperty);
			this.UpdateShaderValue(DirectionProperty);
			this.UpdateShaderValue(UpDownReverseProperty);
			this.UpdateShaderValue(AlphaProperty);
			this.UpdateShaderValue(AlphaMarginHorProperty);
			this.UpdateShaderValue(AlphaMarginVerProperty);
			this.UpdateShaderValue(EffHueProperty);
			this.UpdateShaderValue(EffSatProperty);
			this.UpdateShaderValue(EffLumProperty);
			this.UpdateShaderValue(FogColorProperty);
			this.UpdateShaderValue(OctavesNumProperty);
			this.UpdateShaderValue(ImgshakeProperty);
			this.UpdateShaderValue(ImgshakeSpeedProperty);
			this.UpdateShaderValue(ImgshakeSizeProperty);
			this.UpdateShaderValue(ImgshakeRangeProperty);
		}
		public Brush Input {
			get {
				return ((Brush)(this.GetValue(InputProperty)));
			}
			set {
				this.SetValue(InputProperty, value);
			}
		}
		/// <summary>Time.</summary>
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
		/// <summary>alpha.</summary>
		public double Alpha {
			get {
				return ((double)(this.GetValue(AlphaProperty)));
			}
			set {
				this.SetValue(AlphaProperty, value);
			}
		}
		/// <summary>alphaMarginHor</summary>
		public double AlphaMarginHor {
			get {
				return ((double)(this.GetValue(AlphaMarginHorProperty)));
			}
			set {
				this.SetValue(AlphaMarginHorProperty, value);
			}
		}
		/// <summary>alphaMarginVer</summary>
		public double AlphaMarginVer {
			get {
				return ((double)(this.GetValue(AlphaMarginVerProperty)));
			}
			set {
				this.SetValue(AlphaMarginVerProperty, value);
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
		public Color FogColor {
			get {
				return ((Color)(this.GetValue(FogColorProperty)));
			}
			set {
				this.SetValue(FogColorProperty, value);
			}
		}
		/// <summary>OctavesNum.</summary>
		public double OctavesNum {
			get {
				return ((double)(this.GetValue(OctavesNumProperty)));
			}
			set {
				this.SetValue(OctavesNumProperty, value);
			}
		}
		/// <summary>Imgshake.</summary>
		public double Imgshake {
			get {
				return ((double)(this.GetValue(ImgshakeProperty)));
			}
			set {
				this.SetValue(ImgshakeProperty, value);
			}
		}
		/// <summary>ImgshakeSpeed.</summary>
		public double ImgshakeSpeed {
			get {
				return ((double)(this.GetValue(ImgshakeSpeedProperty)));
			}
			set {
				this.SetValue(ImgshakeSpeedProperty, value);
			}
		}
		/// <summary>ImgshakeSize.</summary>
		public double ImgshakeSize {
			get {
				return ((double)(this.GetValue(ImgshakeSizeProperty)));
			}
			set {
				this.SetValue(ImgshakeSizeProperty, value);
			}
		}
		/// <summary>ImgshakeRang.</summary>
		public double ImgshakeRange {
			get {
				return ((double)(this.GetValue(ImgshakeRangeProperty)));
			}
			set {
				this.SetValue(ImgshakeRangeProperty, value);
			}
		}
	}
}
