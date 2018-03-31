using System;
using Xunit;

namespace AppVeyorDotnetSandbox
{
    public class HelloTest
    {
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
    }
}
