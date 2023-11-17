N = 1000;     % number of data
mlevel = 4;   % size of signal constellation
k = log2(mlevel);   % number of bits per symbol
% signal generation in bit stream
x = randi([0 1], N, 1); %N row 1 cols
disp(length(x));
% convert the bit stream into symbol stream
xsym = bi2de(reshape(x, k, length(x)/k).','left-msb');

% modulation
xmod = qammod(xsym, mlevel);

% Loop through different SNR values
snr_values = 0:50;
ber_values = zeros(size(snr_values));

for idx = 1:length(snr_values)
    SNR = snr_values(idx);

    % adding AWGN
    Tx_awgn = awgn(xmod,SNR,'measured');

    % Received signal
    Rx_x = Tx_awgn;

    % demodulation
    Rx_x_demod = qamdemod(Rx_x, mlevel);

    z = de2bi(Rx_x_demod,'left-msb');
    disp(prod(size(z)));
    Rx_x_BitStream = reshape(z',prod(size(z)),1);

    % Calculate BER
    [number_of_errors, bit_error_rate] = biterr(x,Rx_x_BitStream);
    #The function returns two values:
    %number_of_errors: The total number of bit errors between the original and received bitstreams.
    %bit_error_rate: The bit error rate, which is the ratio of bit errors to the total number of bits.
    ber_values(idx) = bit_error_rate;
end

% Plot BER vs. SNR
%figure;
semilogy(snr_values, ber_values, 'bo-');
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER vs. SNR for QAM');
