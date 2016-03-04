# encoding: utf-8
RSpec.shared_context 'shared encryption setup', a: :b do
  before do
    allow(Settings.encryption).to receive(:public_app_id).and_return('hwf-public-app')
    allow(Settings.encryption).to receive(:staff_app_id).and_return('fr-staff-app')
    allow(Settings.encryption).to receive(:private_key).and_return(private_key.to_pem)
    allow(Settings.encryption).to receive(:public_key).and_return(public_key)
    allow(Settings.cipher).to receive(:key).and_return('3�ď/O�����)&��V[��~��J��J')
    allow(Settings.cipher).to receive(:iv).and_return('msB���]��?�z')
  end

  let(:private_key) do
    ecdsa_key = OpenSSL::PKey::EC.new 'secp521r1'
    ecdsa_key.generate_key
    ecdsa_key
  end

  let(:my_public_key) do
    ecdsa_public = OpenSSL::PKey::EC.new private_key
    ecdsa_public.private_key = nil
    ecdsa_public
  end

  let(:public_key) do
    <<-KEY
-----BEGIN PUBLIC KEY-----
MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQBGSyfQzfNZ7zc2FSgA4nSZO4l+i3v
xKTR7KVT03PrB6okzNQY5uIjmxbwcFb50g2hTKXxYaZ9AsX7NjzCuizbH+oA2zfd
UMHezIyq2XnJdDae2Aq4m2LF1fudTM9jKC32CBrSIlJ9C5Nvhk9MQajqN8aP0LIP
Q50zYLQq87oQdMq6OLw=
-----END PUBLIC KEY-----
    KEY
  end

  let(:session) do
    {
      national_insurance: { 'number' => 'AB123456A' },
      marital_status: { 'married' => 'true' }
    }
  end

  let(:encrypted_return) do
    <<-SOURCE
      TWqWDfDoSJrZNmJDqdYc7UaszFiAr/EgOvgIu9Wb3G+MrUPsCO6xtKEg0s1u
      Dvh26b+Q2Se2G3iwvRHSCrrrDTFrTuTbJNFiVb4F1m4si/5VT+0GDmaEQehI
      68H5gbTTqq0wNWh7395s69vmOt9CbmXo3JMmWemjtTOh1u5bvBeGqpuPPsir
      Mn5Kc5EmLEQMb1uIGa7R33SrTV9nH5GAlsMyq+EB8lBuGdr+/4qQvdi5V8fb
      8QxbgimHSO7WUtmzGbvY2NXtKsjYt45Pw3S43ir2OmWkD+PZMh7CELE5f1eL
      3u4xykrHuK29VzxsXe6XcyWFCDeaKwM25Mdcm9zroQyisNLYRoKCrS1t0HwH
      1bsieIUqe8OCp9kySGc9DN6EzG6qWhq+MfUi4SEySnouY+yKpceCeGOYju5T
      DyUwmXPciigxT8FacJllHnI4qfdkG1ViE9AFnayEaQdOaDsVHdPl7o0LbF3T
      uqTWvHgyTQw=
    SOURCE
  end

  let(:correctly_encoded_encrypted_with_error) do
    <<-SOURCE
      TWqWDfDoSJrZNmJDqdYc7UaszFiAr/EgOvgIu9Wb3G+MrUPsCO6xtKEg0s1u
      Dvh26b+Q2Se2G3iwvRHSCrrrDav6p4JxsRPmiHwVQwE3e/7QBM3UCNb7TYEh
      uRW2QfwfCDY7Xx5tCTCi7WrWS5CPruKH2tfkRsMUsfD7CDP30+pbPC3t4CAc
      ssXNyKa6TBhWEP048FwZolpUgsLbncYcZ9ZCEOw8NkTwhwYx7uzhB3xP/7jU
      nZPmfWFi5xsNb9D2XUSvS23egb5gnVYnPHNg1FFC+hio2uVFaCdi/+q9iXms
      6qCCLj+dIouKPO193qr4UiivLypjH5T+NHRSl6997joK7A5DPHrCEeSx37x4
      /X/2rP3W3o969lw3OIWh6LlfrC9K+4j5o8bcyvBxqwbpubC2r/uJ5tgBfg7O
      XdLv4lz95cXBt8Nks1z5D1eLXClElOXa4/CuRXt+xYTr1gBNKuGMuIpG+KT2
      CUCSHHqjfZs=
    SOURCE
  end

  let(:encrypted_with_wrong_cipher) do
    <<-SOURCE
      lsEVUqhKhpvMnwTszaTdHB0gZtNo+9fHBxA+u6aEyU35jb8kTiqgVs+bcDSD
      BVSy6eU4tQ72pHPcBrucnhQgueFPit1iGjSDKguYlz46VxdK142Pz0ZwHFWe
      iXasyfQ9JGTVD8VQmNh3kzdaEFbHzxW8cWDYm4DChcDcau8W3fqrCXh15IMS
      IY+pj6ZfgspUYHhtmAKxWzHbFJDrst0nd3qMgQXBwvU8NooUFqcTEI2pXJUv
      4YscoDCDXrkf/TiE23YE0nlp7++ay3RtZesE9G7FcYGLNO7DjRHfSly8XPxo
      AgZGFbPGqrteuJT+ay971ChmyEDa4RctHGne49OKpdjIffqL7MStAFX7oinm
      eeoeT6tMUoRazTUuBL1cN0mdRLbWyhfGPFIQuU248p1uxkP5erelEAPhgo3r
      zs20uTcrUQxhYrRREMWN4yf0f6bf0x8S00LYSoogn3bJUDmid8Bm5oHDK3TD
      /p9EyStauKI=
    SOURCE
  end

  let(:encrypted_properly_encoded_with_wrong_audience) do
    <<-SOURCE
      TWqWDfDoSJrZNmJDqdYc7UaszFiAr/EgOvgIu9Wb3G+MrUPsCO6xtKEg0s1u
      Dvh26b+Q2Se2G3iwvRHSCrrrDTFrTuTbJNFiVb4F1m4si/5VT+0GDmaEQehI
      68H5gbTTqq0wNWh7395s69vmOt9CbmXo3JMmWemjtTOh1u5bvBeGqpuPPsir
      Mn5Kc5EmLEQMb1uIGa7R33SrTV9nH5GAlsMyq+EB8lBuGdr+/4qQvdhb+GuD
      d8Zjpetb7v0olO8ktSS3+T9cCSFdiJ2B7cr/uH1ayEx10IGXAwlPM6BE+OcJ
      PlehlRCACvINCxF0IDNzHMe7ZNLy6kTNGd6TjCp8srd/1iEkzorML22j4r58
      3BvaWw27BIoBhmDF8YSQkBcCdAHxUO8x8i0lADXjnpT6BdHjtsvZeIzn1f2X
      RU9S0QnQgNGGFj80EgyVeqkkFEgUxw+TZSGw9yon7pOrH3fiVoirxnWIVHce
      010iG16zAF0=
    SOURCE
  end

  let(:encrypted_properly_encoded_with_wrong_issuer) do
    <<-SOURCE
      TWqWDfDoSJrZNmJDqdYc7UaszFiAr/EgOvgIu9Wb3G+MrUPsCO6xtKEg0s1u
      Dvh26b+Q2Se2G3iwvRHSCrrrDTFrTuTbJNFiVb4F1m4si/5VT+0GDmaEQehI
      68H5gbTTqq0wNWh7395s69vmOt9CbmXo3JMmWemjtTOh1u5bvBeGqpuPPsir
      Mn5Kc5EmLEQM2C5c0m/PxzlqMrhm7CRt9iKH9XZcqU9FyVZFpFdmZ7zECo7p
      3tDmeEQk7e0MKOP5ozw2Izp4b/xeQwUXnPXxVQ/71JWIqMwgYQZWRYtu44tr
      CRZM31k8oSLVCOe95RphFwxBmjvT7NqAH0h7V1D4sX/zgETPN/+q6BsBNI6B
      69wpYFFGI96m9HA9JJpvjzu/2US4EgwwWx4YxdA1kjxuiNDEOA+QBRSgv/x5
      L2a+xHieOGfN46TCd5DYh3D+y/u+GdIFaktPxF5DzI7yEL6EfJUV3/rvdBVe
      JygXTYsPI/E=
    SOURCE
  end

  let(:summary) { Views::Summary.new(session) }
end
