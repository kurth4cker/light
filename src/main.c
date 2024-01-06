#include "src/light.h"
#include "src/helpers.h"

enum {
	LIGHT_RETURNVAL_SUCCESS = 0,
	LIGHT_RETURNVAL_EXECFAIL,
	LIGHT_RETURNVAL_INITFAIL,
};

int main(int argc, char **argv)
{
    light_context_t *light_ctx = light_initialize(argc, argv);
    if(light_ctx == NULL) {
        LIGHT_ERR("Initialization failed");
        return LIGHT_RETURNVAL_INITFAIL;
    }

    if(!light_execute(light_ctx)) {
        LIGHT_ERR("Execution failed");
        light_free(light_ctx);
        return LIGHT_RETURNVAL_EXECFAIL;
    }

    light_free(light_ctx);
    return LIGHT_RETURNVAL_SUCCESS;
}
