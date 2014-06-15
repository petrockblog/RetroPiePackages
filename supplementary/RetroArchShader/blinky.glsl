// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)
varying     vec2 VARtex_300;
varying     vec2 VARtex_240;
varying     vec2 VARtex_180;
varying     vec2 VARtex_120;
varying     vec2 VARtex_60;
varying     vec2 VARtex_0;
varying     vec2 VARtex_direct;


struct input_dummy {
    vec2 _texture_size;
    float _frame_count;
};

struct vert_out {
    vec2 VARtex_direct;
    vec2 VARtex_0;
    vec2 VARtex_60;
    vec2 VARtex_120;
    vec2 VARtex_180;
    vec2 VARtex_240;
    vec2 VARtex_300;
};

vec4 _oPosition1;
vert_out _verts1;
float _TMP5;
float _TMP4;
float _TMP3;
float _TMP2;
float _TMP1;
input_dummy _TMP13;
uniform mat4 MVPMatrix;
input_dummy _IN1;
vec4 _r0017;
float _a0027;
vec2 _r0037;
vec2 _r0043;
vec2 _r0049;
vec2 _r0055;
vec2 _r0061;
vec2 _r0067;
attribute vec4 VertexCoord;
attribute vec4 TexCoord;

 

         mat4 transpose_(mat4 matrix)
         {
            mat4 ret;
            for (int i = 0; i != 4; i++)
               for (int j = 0; j != 4; j++)
                  ret[i][j] = matrix[j][i];

            return ret;
         }
         
uniform int FrameDirection;
uniform int FrameCount;
#ifdef GL_ES
uniform mediump vec2 OutputSize;
uniform mediump vec2 TextureSize;
uniform mediump vec2 InputSize;
#else
uniform vec2 OutputSize;
uniform vec2 TextureSize;
uniform vec2 InputSize;
#endif
void main()
{
    mat4 MVPMatrix_ = transpose_(MVPMatrix);

    vec2 _one;
    float _scale;
    vert_out _TMP14;
    vec2 _TMP15[2];

    _r0017.x = dot(MVPMatrix_[0], VertexCoord);
    _r0017.y = dot(MVPMatrix_[1], VertexCoord);
    _r0017.z = dot(MVPMatrix_[2], VertexCoord);
    _r0017.w = dot(MVPMatrix_[3], VertexCoord);
    _oPosition1 = _r0017;
    _one = 1.00000000E+000/TextureSize;
    _TMP13._frame_count = float(FrameCount)/2.00000000E+001;
    _a0027 = 5.00000000E-001*_TMP13._frame_count;
    _TMP1 = sin(_a0027);
    _scale = 1.00000000E+000 + 2.00000003E-001*_TMP1;
    _TMP2 = cos(_TMP13._frame_count);
    _TMP3 = sin(_TMP13._frame_count);
    _TMP4 = sin(_TMP13._frame_count);
    _TMP5 = cos(_TMP13._frame_count);
    _TMP15[0] = _scale*vec2(_TMP2, _TMP3);
    _TMP15[1] = _scale*vec2(-_TMP4, _TMP5);
    _r0037.x = dot(_TMP15[0], vec2( 1.00000000E+000, 0.00000000E+000));
    _r0037.y = dot(_TMP15[1], vec2( 1.00000000E+000, 0.00000000E+000));
    _r0043.x = dot(_TMP15[0], vec2( 5.00000000E-001, 6.99999988E-001));
    _r0043.y = dot(_TMP15[1], vec2( 5.00000000E-001, 6.99999988E-001));
    _r0049.x = dot(_TMP15[0], vec2( -5.00000000E-001, 6.99999988E-001));
    _r0049.y = dot(_TMP15[1], vec2( -5.00000000E-001, 6.99999988E-001));
    _r0055.x = dot(_TMP15[0], vec2( -1.00000000E+000, 0.00000000E+000));
    _r0055.y = dot(_TMP15[1], vec2( -1.00000000E+000, 0.00000000E+000));
    _r0061.x = dot(_TMP15[0], vec2( -5.00000000E-001, -6.99999988E-001));
    _r0061.y = dot(_TMP15[1], vec2( -5.00000000E-001, -6.99999988E-001));
    _r0067.x = dot(_TMP15[0], vec2( 5.00000000E-001, -6.99999988E-001));
    _r0067.y = dot(_TMP15[1], vec2( 5.00000000E-001, -6.99999988E-001));
    _TMP14.VARtex_0 = TexCoord.xy + _one*_r0037;
    _TMP14.VARtex_60 = TexCoord.xy + _one*_r0043;
    _TMP14.VARtex_120 = TexCoord.xy + _one*_r0049;
    _TMP14.VARtex_180 = TexCoord.xy + _one*_r0055;
    _TMP14.VARtex_240 = TexCoord.xy + _one*_r0061;
    _TMP14.VARtex_300 = TexCoord.xy + _one*_r0067;
    VARtex_direct = TexCoord.xy;
    VARtex_0 = _TMP14.VARtex_0;
    VARtex_60 = _TMP14.VARtex_60;
    VARtex_120 = _TMP14.VARtex_120;
    VARtex_180 = _TMP14.VARtex_180;
    VARtex_240 = _TMP14.VARtex_240;
    VARtex_300 = _TMP14.VARtex_300;
    gl_Position = _r0017;
} 
#elif defined(FRAGMENT)
#ifdef GL_ES
precision mediump float;
#endif
varying     vec2 VARtex_300;
varying     vec2 VARtex_240;
varying     vec2 VARtex_180;
varying     vec2 VARtex_120;
varying     vec2 VARtex_60;
varying     vec2 VARtex_0;
varying     vec2 VARtex_direct;


struct input_dummy {
    vec2 _texture_size;
    float _frame_count;
};

struct vert_out {
    vec2 VARtex_direct;
    vec2 VARtex_0;
    vec2 VARtex_60;
    vec2 VARtex_120;
    vec2 VARtex_180;
    vec2 VARtex_240;
    vec2 VARtex_300;
};

vec4 _ret_0;
float _TMP12;
float _TMP11;
float _TMP10;
float _TMP9;
vec4 _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
vec4 _TMP0;
vert_out _verts1;
uniform sampler2D Texture;
vec4 _TMP49;
vec4 _x0050;

 
uniform int FrameDirection;
uniform int FrameCount;
#ifdef GL_ES
uniform mediump vec2 OutputSize;
uniform mediump vec2 TextureSize;
uniform mediump vec2 InputSize;
#else
uniform vec2 OutputSize;
uniform vec2 TextureSize;
uniform vec2 InputSize;
#endif
void main()
{

    vec4 _tex_mid;
    vec4 _tex0;
    vec4 _tex60;
    vec4 _tex120;
    vec4 _tex180;
    vec4 _tex240;
    vec4 _tex300;
    vec4 _minimum;
    vec4 _maximum;
    vec4 _diff;

    _tex_mid = texture2D(Texture, VARtex_direct);
    _tex0 = texture2D(Texture, VARtex_0);
    _tex60 = texture2D(Texture, VARtex_60);
    _tex120 = texture2D(Texture, VARtex_120);
    _tex180 = texture2D(Texture, VARtex_180);
    _tex240 = texture2D(Texture, VARtex_240);
    _tex300 = texture2D(Texture, VARtex_300);
    _TMP0 = min(_tex0, _tex60);
    _TMP1 = min(_tex120, _tex180);
    _TMP2 = min(_TMP0, _TMP1);
    _TMP3 = min(_tex240, _tex300);
    _minimum = min(_TMP2, _TMP3);
    _TMP4 = max(_tex0, _tex60);
    _TMP5 = max(_tex120, _tex180);
    _TMP6 = max(_TMP4, _TMP5);
    _TMP7 = max(_tex240, _tex300);
    _maximum = max(_TMP6, _TMP7);
    _x0050 = -(_maximum - _minimum);
    _TMP9 = pow(2.71828198E+000, _x0050.x);
    _TMP10 = pow(2.71828198E+000, _x0050.y);
    _TMP11 = pow(2.71828198E+000, _x0050.z);
    _TMP12 = pow(2.71828198E+000, _x0050.w);
    _TMP49 = vec4(_TMP9, _TMP10, _TMP11, _TMP12);
    _diff = 1.00000000E+000 - _TMP49;
    _ret_0 = _tex_mid + 8.99999976E-001*(_diff - _tex_mid);
    gl_FragColor = _ret_0;
    return;
} 
#endif
