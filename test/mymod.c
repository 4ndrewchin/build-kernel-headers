#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("");
MODULE_DESCRIPTION("");

static int __init mod_enter(void)
{
    printk("Entering module\r\n");
    return 0;
}

static int __exit mod_exit(void)
{
    printk("Exiting module\r\n");
}
