% 关联文档: docs/phases/tx/P0_USRP_Link_Verification.md
% 关联上下文: AI_CONTEXT.md
% 阶段定位: P0-B 已知单音 CW 基带生成
% 说明: 生成 1 MHz 复单音 IQ 数据并导出为 sc16 交织格式，
%      用于 USRP B210 的基础链路验证。

fprintf('\n');
fprintf('============================================================\n');
fprintf('BOC-TDMA P0-B 1 MHz 复单音 CW 生成\n');
fprintf('============================================================\n');

% 锁定参数
fs = 36e6;
f_tone = 1e6;
amplitude = 0.30;
num_cycles = 1000;
output_bin = 'p0_cw_tone_1MHz_sc16.bin';

% 让数据长度恰好包含整数个周期，避免截断泄漏
samples_per_cycle = fs / gcd(round(fs), round(f_tone));
N = samples_per_cycle * num_cycles;
n = 0:(N - 1);

% P0 阶段使用复指数单音，便于区分信号峰与镜像分量
x = amplitude * exp(1j * 2 * pi * f_tone * n / fs);

% 归一化并量化为 sc16
peak = max(abs([real(x), imag(x)]));
if peak > 1.0
    error('归一化前峰值超过 1.0，无法安全量化为 int16。');
end

i_sc16 = int16(round(real(x) * 32767));
q_sc16 = int16(round(imag(x) * 32767));
iq_interleaved = reshape([i_sc16; q_sc16], 1, []);

fid = fopen(output_bin, 'wb');
if fid < 0
    error('无法打开输出文件: %s', output_bin);
end
fwrite(fid, iq_interleaved, 'int16');
fclose(fid);

% FFT 自检
X = fft(x);
[~, peak_idx] = max(abs(X));
freq_axis = (0:(N - 1)) * fs / N;
peak_freq = freq_axis(peak_idx);

fprintf('输出文件: %s\n', output_bin);
fprintf('采样率: %.0f Hz\n', fs);
fprintf('单音频率: %.0f Hz\n', f_tone);
fprintf('样点数: %d\n', N);
fprintf('每周期样点数: %.0f\n', samples_per_cycle);
fprintf('幅度: %.2f\n', amplitude);
fprintf('量化峰值: I=%d, Q=%d\n', max(abs(i_sc16)), max(abs(q_sc16)));
fprintf('FFT 主峰频率: %.0f Hz\n', peak_freq);
fprintf('============================================================\n\n');
