/**
 * @file ignore_assert.c
 * @brief 忽略断言
 * @author dino
 * @version v1
 * @date 2021-10-06
 */

#define NDEBUG // 忽略断言

#include<assert.h>

int main(){
    int x=7;
    assert(x==5);
    return 0;
}