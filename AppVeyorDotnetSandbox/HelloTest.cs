using System;
using ImageMagick;
using Xunit;

namespace AppVeyorDotnetSandbox
{
    public class HelloTest
    {
        [Fact]
        public void HelloMagick()
        {
            using (MagickImage image = new MagickImage(MagickColors.AliceBlue, 10, 10))
            {
                image.Resize(new Percentage(0.8));
            }
        }

        [Fact]
        public void Test1()
        {
        }

        [Theory]
        [InlineData(false)]
        [InlineData(true)]
        public void Test2(bool foo)
        {
            Assert.True(true || foo);
        }

        [Fact]
        public void FailOn32Bits()
        {
            Assert.Equal(8, IntPtr.Size);
        }

        [Fact]
        public void UseSpan()
        {
            int[] array = { 1, 2, 3 };
            Span<int> span = new Span<int>(array);

            Assert.Equal(3, span[2]);
        }
    }
}
