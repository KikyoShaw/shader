using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Effects;
using System.Windows.Media.Media3D;


namespace Huya.VideoPlayer.Module.Barrage.Sharder
{
	
	public class FadeInWeightEffect : ShaderEffect {
		public static readonly DependencyProperty InputProperty = ShaderEffect.RegisterPixelShaderSamplerProperty("Input", typeof(FadeInWeightEffect), 0);
		public static readonly DependencyProperty IChanel1Property = ShaderEffect.RegisterPixelShaderSamplerProperty("IChanel1", typeof(FadeInWeightEffect), 1);
        public static readonly DependencyProperty ImgFadeProperty = DependencyProperty.Register("ImgFade", typeof(double), typeof(FadeInWeightEffect), new UIPropertyMetadata(((double)(0.8D)), PixelShaderConstantCallback(0)));
		public static readonly DependencyProperty FageMarginProperty = DependencyProperty.Register("FageMargin", typeof(Point4D), typeof(FadeInWeightEffect), new UIPropertyMetadata(new Point4D(0.2D, 0.2D, 0.2D, 0.55D), PixelShaderConstantCallback(1)));
        public static readonly DependencyProperty MaskMinFadeProperty = DependencyProperty.Register("MaskMinFade", typeof(double), typeof(FadeInWeightEffect), new UIPropertyMetadata(((double)(0.0D)), PixelShaderConstantCallback(2)));
        
        public FadeInWeightEffect() 
        {
			PixelShader pixelShader = new PixelShader();
			pixelShader.UriSource = new Uri("pack://application:,,,/Huya.VideoPlayer;component/Module/Barrage/Shader/FadeInWeightEffect.ps");
			this.PixelShader = pixelShader;

			this.UpdateShaderValue(InputProperty);
			this.UpdateShaderValue(ImgFadeProperty);
			this.UpdateShaderValue(FageMarginProperty);
            this.UpdateShaderValue(MaskMinFadeProperty);
        }

        public Brush Input
        {
            get
            {
                return ((Brush)(this.GetValue(InputProperty)));
            }
            set
            {
                this.SetValue(InputProperty, value);
            }
        }
        public Brush IChanel1
        {
            get
            {
                return ((Brush)(this.GetValue(IChanel1Property)));
            }
            set
            {
                this.SetValue(IChanel1Property, value);
            }
        }
        /// <summary>ImgFade.</summary>
        public double ImgFade
        {
            get
            {
                return ((double)(this.GetValue(ImgFadeProperty)));
            }
            set
            {
                this.SetValue(ImgFadeProperty, value);
            }
        }
        /// <summary>FramMargin.</summary>
        public Point4D FageMargin
        {
            get
            {
                return ((Point4D)(this.GetValue(FageMarginProperty)));
            }
            set
            {
                this.SetValue(FageMarginProperty, value);
            }
        }
        /// <summary>ImgFade.</summary>
        public double MaskMinFade
        {
            get
            {
                return ((double)(this.GetValue(MaskMinFadeProperty)));
            }
            set
            {
                this.SetValue(MaskMinFadeProperty, value);
            }
        }
    }
}
