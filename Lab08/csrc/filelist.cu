PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _30218_archive_1.so
_30218_archive_1.so : archive.57/_30218_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../RegisterSim.daidir//_30218_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../RegisterSim.daidir//_30218_archive_1.so $@



VCS_ARC0 =_csrc0.so

VCS_OBJS0 =objs/amcQw_d.o 



%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<

$(VCS_ARC0) : $(VCS_OBJS0)
	$(PIC_LD) -shared  -o .//../RegisterSim.daidir//$(VCS_ARC0) $(VCS_OBJS0)
	rm -f $(VCS_ARC0)
	@ln -sf .//../RegisterSim.daidir//$(VCS_ARC0) $(VCS_ARC0)

CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \


CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(VCS_ARC0) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

