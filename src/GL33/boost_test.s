	.text
	.file	"boost_test.cpp"
	.section	.text.startup,"ax",@progbits
	.align	16, 0x90
	.type	__cxx_global_var_init,@function
__cxx_global_var_init:                  # @__cxx_global_var_init
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$_ZStL8__ioinit, %rdi
	callq	_ZNSt8ios_base4InitC1Ev
	movabsq	$_ZNSt8ios_base4InitD1Ev, %rdi
	movabsq	$_ZStL8__ioinit, %rsi
	movabsq	$__dso_handle, %rdx
	callq	__cxa_atexit
	movl	%eax, -4(%rbp)          # 4-byte Spill
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	__cxx_global_var_init, .Lfunc_end0-__cxx_global_var_init
	.cfi_endproc

	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 3, __gxx_personality_v0
	.cfi_lsda 3, .Lexception0
# BB#0:
	pushq	%rbp
.Ltmp21:
	.cfi_def_cfa_offset 16
.Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp23:
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	movl	$0, -4(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -112(%rbp)        # 8-byte Spill
	callq	_ZNSaIcEC1Ev
.Ltmp3:
	movl	$.L.str, %ecx
	movl	%ecx, %esi
	leaq	-40(%rbp), %rdi
	movq	-112(%rbp), %rdx        # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.Ltmp4:
	jmp	.LBB1_1
.LBB1_1:
	leaq	-48(%rbp), %rdi
	callq	_ZNSaIcED1Ev
	leaq	-104(%rbp), %rdi
	movq	%rdi, -120(%rbp)        # 8-byte Spill
	callq	_ZNSt6localeC1Ev
.Ltmp6:
	leaq	-96(%rbp), %rdi
	leaq	-40(%rbp), %rsi
	movq	-120(%rbp), %rdx        # 8-byte Reload
	callq	_ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale
.Ltmp7:
	jmp	.LBB1_2
.LBB1_2:
.Ltmp8:
	movl	$_ZSt4cout, %eax
	movl	%eax, %edi
	leaq	-96(%rbp), %rsi
	callq	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
.Ltmp9:
	movq	%rax, -128(%rbp)        # 8-byte Spill
	jmp	.LBB1_3
.LBB1_3:
.Ltmp10:
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %eax
	movl	%eax, %esi
	movq	-128(%rbp), %rdi        # 8-byte Reload
	callq	_ZNSolsEPFRSoS_E
.Ltmp11:
	movq	%rax, -136(%rbp)        # 8-byte Spill
	jmp	.LBB1_4
.LBB1_4:
.Ltmp15:
	leaq	-96(%rbp), %rdi
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
.Ltmp16:
	jmp	.LBB1_5
.LBB1_5:
	leaq	-104(%rbp), %rdi
	callq	_ZNSt6localeD1Ev
	leaq	-40(%rbp), %rdi
	movl	$0, -4(%rbp)
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movl	-4(%rbp), %eax
	addq	$144, %rsp
	popq	%rbp
	retq
.LBB1_6:
.Ltmp5:
	leaq	-48(%rbp), %rdi
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
	callq	_ZNSaIcED1Ev
	jmp	.LBB1_12
.LBB1_7:
.Ltmp17:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
	jmp	.LBB1_10
.LBB1_8:
.Ltmp12:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
.Ltmp13:
	leaq	-96(%rbp), %rdi
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
.Ltmp14:
	jmp	.LBB1_9
.LBB1_9:
	jmp	.LBB1_10
.LBB1_10:
	leaq	-104(%rbp), %rdi
	callq	_ZNSt6localeD1Ev
.Ltmp18:
	leaq	-40(%rbp), %rdi
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
.Ltmp19:
	jmp	.LBB1_11
.LBB1_11:
	jmp	.LBB1_12
.LBB1_12:
	movq	-56(%rbp), %rdi
	callq	_Unwind_Resume
.LBB1_13:
.Ltmp20:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -140(%rbp)        # 4-byte Spill
	callq	__clang_call_terminate
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.align	4
GCC_except_table1:
.Lexception0:
	.byte	255                     # @LPStart Encoding = omit
	.byte	3                       # @TType Encoding = udata4
	.asciz	"\343\200"              # @TType base offset
	.byte	3                       # Call site Encoding = udata4
	.byte	91                      # Call site table length
	.long	.Ltmp3-.Lfunc_begin0    # >> Call Site 1 <<
	.long	.Ltmp4-.Ltmp3           #   Call between .Ltmp3 and .Ltmp4
	.long	.Ltmp5-.Lfunc_begin0    #     jumps to .Ltmp5
	.byte	0                       #   On action: cleanup
	.long	.Ltmp6-.Lfunc_begin0    # >> Call Site 2 <<
	.long	.Ltmp7-.Ltmp6           #   Call between .Ltmp6 and .Ltmp7
	.long	.Ltmp17-.Lfunc_begin0   #     jumps to .Ltmp17
	.byte	0                       #   On action: cleanup
	.long	.Ltmp8-.Lfunc_begin0    # >> Call Site 3 <<
	.long	.Ltmp11-.Ltmp8          #   Call between .Ltmp8 and .Ltmp11
	.long	.Ltmp12-.Lfunc_begin0   #     jumps to .Ltmp12
	.byte	0                       #   On action: cleanup
	.long	.Ltmp15-.Lfunc_begin0   # >> Call Site 4 <<
	.long	.Ltmp16-.Ltmp15         #   Call between .Ltmp15 and .Ltmp16
	.long	.Ltmp17-.Lfunc_begin0   #     jumps to .Ltmp17
	.byte	0                       #   On action: cleanup
	.long	.Ltmp16-.Lfunc_begin0   # >> Call Site 5 <<
	.long	.Ltmp13-.Ltmp16         #   Call between .Ltmp16 and .Ltmp13
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp13-.Lfunc_begin0   # >> Call Site 6 <<
	.long	.Ltmp19-.Ltmp13         #   Call between .Ltmp13 and .Ltmp19
	.long	.Ltmp20-.Lfunc_begin0   #     jumps to .Ltmp20
	.byte	1                       #   On action: 1
	.long	.Ltmp19-.Lfunc_begin0   # >> Call Site 7 <<
	.long	.Lfunc_end1-.Ltmp19     #   Call between .Ltmp19 and .Lfunc_end1
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.byte	1                       # >> Action Record 1 <<
                                        #   Catch TypeInfo 1
	.byte	0                       #   No further actions
                                        # >> Catch TypeInfos <<
	.long	0                       # TypeInfo 1
	.align	4

	.section	.text._ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale,"axG",@progbits,_ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale,comdat
	.weak	_ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale
	.align	16, 0x90
	.type	_ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale,@function
_ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale: # @_ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp24:
	.cfi_def_cfa_offset 16
.Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp26:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, %rax
	leaq	-24(%rbp), %rcx
	movq	%rsi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdx
	movq	%rdi, -32(%rbp)         # 8-byte Spill
	movq	%rcx, %rdi
	movq	%rsi, -40(%rbp)         # 8-byte Spill
	movq	%rdx, %rsi
	movq	%rax, -48(%rbp)         # 8-byte Spill
	callq	_ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rdi         # 8-byte Reload
	movq	-40(%rbp), %rsi         # 8-byte Reload
	callq	_ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_
	movq	-48(%rbp), %rax         # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	_ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale, .Lfunc_end2-_ZN5boost9algorithm13to_upper_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET_RKS8_RKSt6locale
	.cfi_endproc

	.section	.text.__clang_call_terminate,"axG",@progbits,__clang_call_terminate,comdat
	.hidden	__clang_call_terminate
	.weak	__clang_call_terminate
	.align	16, 0x90
	.type	__clang_call_terminate,@function
__clang_call_terminate:                 # @__clang_call_terminate
# BB#0:
	pushq	%rax
	callq	__cxa_begin_catch
	movq	%rax, (%rsp)            # 8-byte Spill
	callq	_ZSt9terminatev
.Lfunc_end3:
	.size	__clang_call_terminate, .Lfunc_end3-__clang_call_terminate

	.section	.text._ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_,"axG",@progbits,_ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_,comdat
	.weak	_ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_
	.align	16, 0x90
	.type	_ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_,@function
_ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_: # @_ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_
.Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 3, __gxx_personality_v0
	.cfi_lsda 3, .Lexception1
# BB#0:
	pushq	%rbp
.Ltmp30:
	.cfi_def_cfa_offset 16
.Ltmp31:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp32:
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, %rax
	movq	%rdx, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdi, -112(%rbp)        # 8-byte Spill
	movq	%rsi, %rdi
	movq	%rax, -120(%rbp)        # 8-byte Spill
	callq	_ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_
	movq	%rax, -40(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rdi
	movq	%rax, %rsi
	callq	_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_
	movq	%rax, -72(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-72(%rbp), %rdi
	movq	%rax, %rsi
	callq	_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	leaq	-88(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -128(%rbp)        # 8-byte Spill
	callq	_ZNSaIcEC1Ev
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %r8
.Ltmp27:
	movq	-112(%rbp), %rdi        # 8-byte Reload
	movq	-128(%rbp), %r9         # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_
.Ltmp28:
	jmp	.LBB4_1
.LBB4_1:
	leaq	-88(%rbp), %rdi
	callq	_ZNSaIcED1Ev
	movq	-120(%rbp), %rax        # 8-byte Reload
	addq	$128, %rsp
	popq	%rbp
	retq
.LBB4_2:
.Ltmp29:
	leaq	-88(%rbp), %rdi
	movl	%edx, %ecx
	movq	%rax, -96(%rbp)
	movl	%ecx, -100(%rbp)
	callq	_ZNSaIcED1Ev
# BB#3:
	movq	-96(%rbp), %rdi
	callq	_Unwind_Resume
.Lfunc_end4:
	.size	_ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_, .Lfunc_end4-_ZN5boost9algorithm6detail20transform_range_copyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_NS1_9to_upperFIcEEEET_RKT0_T1_
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.align	4
GCC_except_table4:
.Lexception1:
	.byte	255                     # @LPStart Encoding = omit
	.byte	3                       # @TType Encoding = udata4
	.byte	41                      # @TType base offset
	.byte	3                       # Call site Encoding = udata4
	.byte	39                      # Call site table length
	.long	.Lfunc_begin1-.Lfunc_begin1 # >> Call Site 1 <<
	.long	.Ltmp27-.Lfunc_begin1   #   Call between .Lfunc_begin1 and .Ltmp27
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp27-.Lfunc_begin1   # >> Call Site 2 <<
	.long	.Ltmp28-.Ltmp27         #   Call between .Ltmp27 and .Ltmp28
	.long	.Ltmp29-.Lfunc_begin1   #     jumps to .Ltmp29
	.byte	0                       #   On action: cleanup
	.long	.Ltmp28-.Lfunc_begin1   # >> Call Site 3 <<
	.long	.Lfunc_end4-.Ltmp28     #   Call between .Ltmp28 and .Lfunc_end4
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.align	4

	.section	.text._ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale,"axG",@progbits,_ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale,comdat
	.weak	_ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale
	.align	16, 0x90
	.type	_ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale,@function
_ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale: # @_ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp33:
	.cfi_def_cfa_offset 16
.Ltmp34:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp35:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	%rdi, (%rsi)
	popq	%rbp
	retq
.Lfunc_end5:
	.size	_ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale, .Lfunc_end5-_ZN5boost9algorithm6detail9to_upperFIcEC2ERKSt6locale
	.cfi_endproc

	.section	.text._ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_,"axG",@progbits,_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_,comdat
	.weak	_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_
	.align	16, 0x90
	.type	_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_,@function
_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_: # @_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp36:
	.cfi_def_cfa_offset 16
.Ltmp37:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp38:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rsi, -40(%rbp)
	leaq	-16(%rbp), %rdi
	leaq	-24(%rbp), %rax
	movq	%rsi, -48(%rbp)         # 8-byte Spill
	movq	%rax, %rsi
	movq	-48(%rbp), %rdx         # 8-byte Reload
	callq	_ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end6:
	.size	_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_, .Lfunc_end6-_ZN5boost9iterators23make_transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEEENS0_18transform_iteratorIT_T0_NS0_11use_defaultESK_EESJ_SI_
	.cfi_endproc

	.section	.text._ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_,"axG",@progbits,_ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_,comdat
	.weak	_ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_
	.align	16, 0x90
	.type	_ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_,@function
_ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_: # @_ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp39:
	.cfi_def_cfa_offset 16
.Ltmp40:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp41:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end7:
	.size	_ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_, .Lfunc_end7-_ZN5boost17range_adl_barrier5beginINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_
	.cfi_endproc

	.section	.text._ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_,"axG",@progbits,_ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_,comdat
	.weak	_ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_
	.align	16, 0x90
	.type	_ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_,@function
_ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_: # @_ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp42:
	.cfi_def_cfa_offset 16
.Ltmp43:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp44:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end8:
	.size	_ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_, .Lfunc_end8-_ZN5boost17range_adl_barrier3endINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIKT_vE4typeERSA_
	.cfi_endproc

	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_,comdat
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_
	.align	16, 0x90
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_,@function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_: # @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_
.Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 3, __gxx_personality_v0
	.cfi_lsda 3, .Lexception2
# BB#0:
	pushq	%rbp
.Ltmp48:
	.cfi_def_cfa_offset 16
.Ltmp49:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp50:
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movq	%rsi, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -24(%rbp)
	movq	%rdi, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-40(%rbp), %rcx
	movq	%rcx, %rdi
	movq	%rcx, -104(%rbp)        # 8-byte Spill
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv
	movq	-48(%rbp), %rdx
	movq	-104(%rbp), %rdi        # 8-byte Reload
	movq	%rax, %rsi
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_
	movups	-16(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movups	-32(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %r8
.Ltmp45:
	movq	-104(%rbp), %rdi        # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_
.Ltmp46:
	jmp	.LBB9_1
.LBB9_1:
	addq	$112, %rsp
	popq	%rbp
	retq
.LBB9_2:
.Ltmp47:
	movl	%edx, %ecx
	movq	%rax, -88(%rbp)
	movl	%ecx, -92(%rbp)
	movq	-104(%rbp), %rdi        # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
# BB#3:
	movq	-88(%rbp), %rdi
	callq	_Unwind_Resume
.Lfunc_end9:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_, .Lfunc_end9-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEET_SK_RKS3_
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.align	4
GCC_except_table9:
.Lexception2:
	.byte	255                     # @LPStart Encoding = omit
	.byte	3                       # @TType Encoding = udata4
	.byte	41                      # @TType base offset
	.byte	3                       # Call site Encoding = udata4
	.byte	39                      # Call site table length
	.long	.Lfunc_begin2-.Lfunc_begin2 # >> Call Site 1 <<
	.long	.Ltmp45-.Lfunc_begin2   #   Call between .Lfunc_begin2 and .Ltmp45
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp45-.Lfunc_begin2   # >> Call Site 2 <<
	.long	.Ltmp46-.Ltmp45         #   Call between .Ltmp45 and .Ltmp46
	.long	.Ltmp47-.Lfunc_begin2   #     jumps to .Ltmp47
	.byte	0                       #   On action: cleanup
	.long	.Ltmp46-.Lfunc_begin2   # >> Call Site 3 <<
	.long	.Lfunc_end9-.Ltmp46     #   Call between .Ltmp46 and .Lfunc_end9
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.align	4

	.section	.text._ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_,"axG",@progbits,_ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_,comdat
	.weak	_ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_
	.align	16, 0x90
	.type	_ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_,@function
_ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_: # @_ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp51:
	.cfi_def_cfa_offset 16
.Ltmp52:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp53:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdx, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	-24(%rbp), %rdi
	movq	%rdi, -32(%rbp)         # 8-byte Spill
	movq	%rsi, %rdi
	movq	-32(%rbp), %rsi         # 8-byte Reload
	movq	%rdx, -40(%rbp)         # 8-byte Spill
	callq	_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_
	movq	-8(%rbp), %rdx
	movq	-40(%rbp), %rsi         # 8-byte Reload
	movq	%rdx, 8(%rsi)
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end10:
	.size	_ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_, .Lfunc_end10-_ZN5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_EC2ERKSG_S5_
	.cfi_endproc

	.section	.text._ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_,"axG",@progbits,_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_,comdat
	.weak	_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_
	.align	16, 0x90
	.type	_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_,@function
_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_: # @_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp54:
	.cfi_def_cfa_offset 16
.Ltmp55:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp56:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	(%rdi), %rdi
	movq	%rdi, (%rsi)
	popq	%rbp
	retq
.Lfunc_end11:
	.size	_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_, .Lfunc_end11-_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_EC2ERKSH_
	.cfi_endproc

	.section	.text._ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_,"axG",@progbits,_ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_,comdat
	.weak	_ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_
	.align	16, 0x90
	.type	_ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_,@function
_ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_: # @_ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp57:
	.cfi_def_cfa_offset 16
.Ltmp58:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp59:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5beginEv
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end12:
	.size	_ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_, .Lfunc_end12-_ZN5boost12range_detail11range_beginIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_
	.cfi_endproc

	.section	.text._ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_,"axG",@progbits,_ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_,comdat
	.weak	_ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_
	.align	16, 0x90
	.type	_ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_,@function
_ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_: # @_ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp60:
	.cfi_def_cfa_offset 16
.Ltmp61:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp62:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE3endEv
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end13:
	.size	_ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_, .Lfunc_end13-_ZN5boost12range_detail9range_endIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS_14range_iteratorIT_vE4typeERSA_
	.cfi_endproc

	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_,comdat
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_
	.align	16, 0x90
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_,@function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_: # @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp63:
	.cfi_def_cfa_offset 16
.Ltmp64:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp65:
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rsi, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -24(%rbp)
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movq	%rcx, -56(%rbp)
	movq	-8(%rbp), %rcx
	movq	%rcx, -48(%rbp)
	movq	-32(%rbp), %rcx
	movq	%rcx, -72(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rcx, -64(%rbp)
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdx
	movq	-72(%rbp), %rcx
	movq	-64(%rbp), %r8
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type
	addq	$80, %rsp
	popq	%rbp
	retq
.Lfunc_end14:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_, .Lfunc_end14-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_
	.cfi_endproc

	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,comdat
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.align	16, 0x90
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,@function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev: # @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp66:
	.cfi_def_cfa_offset 16
.Ltmp67:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp68:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_ZNSaIcED2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end15:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, .Lfunc_end15-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.cfi_endproc

	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type,comdat
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type
	.align	16, 0x90
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type,@function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type: # @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp69:
	.cfi_def_cfa_offset 16
.Ltmp70:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp71:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	%rsi, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -24(%rbp)
	movq	%rdi, -48(%rbp)
	movq	-48(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movq	%rcx, -64(%rbp)
	movq	-8(%rbp), %rcx
	movq	%rcx, -56(%rbp)
	movq	-32(%rbp), %rcx
	movq	%rcx, -80(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rcx, -72(%rbp)
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %r8
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag
	addq	$96, %rsp
	popq	%rbp
	retq
.Lfunc_end16:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type, .Lfunc_end16-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St12__false_type
	.cfi_endproc

	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag,comdat
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag
	.align	16, 0x90
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag,@function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag: # @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag
.Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 3, __gxx_personality_v0
	.cfi_lsda 3, .Lexception3
# BB#0:
	pushq	%rbp
.Ltmp101:
	.cfi_def_cfa_offset 16
.Ltmp102:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp103:
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	movq	%rsi, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -24(%rbp)
	movq	%rdi, -48(%rbp)
	movq	-48(%rbp), %rcx
	movq	$0, -56(%rbp)
	movq	$15, -64(%rbp)
	movq	%rcx, -96(%rbp)         # 8-byte Spill
.LBB17_1:                               # =>This Inner Loop Header: Depth=1
	leaq	-32(%rbp), %rax
	leaq	-16(%rbp), %rcx
	movq	%rcx, %rdi
	movq	%rax, %rsi
	callq	_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE
	xorl	%edx, %edx
	movb	%dl, %r8b
	testb	$1, %al
	movb	%r8b, -97(%rbp)         # 1-byte Spill
	jne	.LBB17_2
	jmp	.LBB17_3
.LBB17_2:                               #   in Loop: Header=BB17_1 Depth=1
	movq	-56(%rbp), %rax
	cmpq	-64(%rbp), %rax
	setb	%cl
	movb	%cl, -97(%rbp)          # 1-byte Spill
.LBB17_3:                               #   in Loop: Header=BB17_1 Depth=1
	movb	-97(%rbp), %al          # 1-byte Reload
	testb	$1, %al
	jne	.LBB17_4
	jmp	.LBB17_5
.LBB17_4:                               #   in Loop: Header=BB17_1 Depth=1
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	callq	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv
	movq	-56(%rbp), %rdi
	movq	%rdi, %rcx
	addq	$1, %rcx
	movq	%rcx, -56(%rbp)
	movq	-96(%rbp), %rcx         # 8-byte Reload
	movq	%rdi, -112(%rbp)        # 8-byte Spill
	movq	%rcx, %rdi
	movb	%al, -113(%rbp)         # 1-byte Spill
	callq	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv
	leaq	-16(%rbp), %rcx
	movq	-112(%rbp), %rdi        # 8-byte Reload
	movb	-113(%rbp), %dl         # 1-byte Reload
	movb	%dl, (%rax,%rdi)
	movq	%rcx, %rdi
	callq	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv
	movq	%rax, -128(%rbp)        # 8-byte Spill
	jmp	.LBB17_1
.LBB17_5:
	jmp	.LBB17_6
.LBB17_6:                               # =>This Inner Loop Header: Depth=1
.Ltmp72:
	leaq	-16(%rbp), %rdi
	leaq	-32(%rbp), %rsi
	callq	_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE
.Ltmp73:
	movb	%al, -129(%rbp)         # 1-byte Spill
	jmp	.LBB17_7
.LBB17_7:                               #   in Loop: Header=BB17_6 Depth=1
	movb	-129(%rbp), %al         # 1-byte Reload
	testb	$1, %al
	jne	.LBB17_8
	jmp	.LBB17_23
.LBB17_8:                               #   in Loop: Header=BB17_6 Depth=1
	movq	-56(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jne	.LBB17_19
# BB#9:                                 #   in Loop: Header=BB17_6 Depth=1
	movq	-56(%rbp), %rax
	incq	%rax
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rdx
.Ltmp74:
	leaq	-64(%rbp), %rsi
	movq	-96(%rbp), %rdi         # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.Ltmp75:
	movq	%rax, -144(%rbp)        # 8-byte Spill
	jmp	.LBB17_10
.LBB17_10:                              #   in Loop: Header=BB17_6 Depth=1
	movq	-144(%rbp), %rax        # 8-byte Reload
	movq	%rax, -88(%rbp)
.Ltmp76:
	movq	-96(%rbp), %rdi         # 8-byte Reload
	movq	%rax, -152(%rbp)        # 8-byte Spill
	callq	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv
.Ltmp77:
	movq	%rax, -160(%rbp)        # 8-byte Spill
	jmp	.LBB17_11
.LBB17_11:                              #   in Loop: Header=BB17_6 Depth=1
	movq	-56(%rbp), %rdx
.Ltmp78:
	movq	-152(%rbp), %rdi        # 8-byte Reload
	movq	-160(%rbp), %rsi        # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcm
.Ltmp79:
	jmp	.LBB17_12
.LBB17_12:                              #   in Loop: Header=BB17_6 Depth=1
.Ltmp80:
	movq	-96(%rbp), %rdi         # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.Ltmp81:
	jmp	.LBB17_13
.LBB17_13:                              #   in Loop: Header=BB17_6 Depth=1
	movq	-88(%rbp), %rsi
.Ltmp82:
	movq	-96(%rbp), %rdi         # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc
.Ltmp83:
	jmp	.LBB17_14
.LBB17_14:                              #   in Loop: Header=BB17_6 Depth=1
	movq	-64(%rbp), %rsi
.Ltmp84:
	movq	-96(%rbp), %rdi         # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm
.Ltmp85:
	jmp	.LBB17_15
.LBB17_15:                              #   in Loop: Header=BB17_6 Depth=1
	jmp	.LBB17_19
.LBB17_16:
.Ltmp92:
	movl	%edx, %ecx
	movq	%rax, -72(%rbp)
	movl	%ecx, -76(%rbp)
# BB#17:
	movq	-72(%rbp), %rdi
	callq	__cxa_begin_catch
.Ltmp93:
	movq	-96(%rbp), %rdi         # 8-byte Reload
	movq	%rax, -168(%rbp)        # 8-byte Spill
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.Ltmp94:
	jmp	.LBB17_18
.LBB17_18:
.Ltmp95:
	callq	__cxa_rethrow
.Ltmp96:
	jmp	.LBB17_29
.LBB17_19:                              #   in Loop: Header=BB17_6 Depth=1
.Ltmp86:
	leaq	-16(%rbp), %rdi
	callq	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv
.Ltmp87:
	movb	%al, -169(%rbp)         # 1-byte Spill
	jmp	.LBB17_20
.LBB17_20:                              #   in Loop: Header=BB17_6 Depth=1
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	incq	%rcx
	movq	%rcx, -56(%rbp)
.Ltmp88:
	movq	-96(%rbp), %rdi         # 8-byte Reload
	movq	%rax, -184(%rbp)        # 8-byte Spill
	callq	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv
.Ltmp89:
	movq	%rax, -192(%rbp)        # 8-byte Spill
	jmp	.LBB17_21
.LBB17_21:                              #   in Loop: Header=BB17_6 Depth=1
	movq	-192(%rbp), %rax        # 8-byte Reload
	movq	-184(%rbp), %rcx        # 8-byte Reload
	movb	-169(%rbp), %dl         # 1-byte Reload
	movb	%dl, (%rax,%rcx)
.Ltmp90:
	leaq	-16(%rbp), %rdi
	callq	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv
.Ltmp91:
	movq	%rax, -200(%rbp)        # 8-byte Spill
	jmp	.LBB17_22
.LBB17_22:                              #   in Loop: Header=BB17_6 Depth=1
	jmp	.LBB17_6
.LBB17_23:
	jmp	.LBB17_26
.LBB17_24:
.Ltmp97:
	movl	%edx, %ecx
	movq	%rax, -72(%rbp)
	movl	%ecx, -76(%rbp)
.Ltmp98:
	callq	__cxa_end_catch
.Ltmp99:
	jmp	.LBB17_25
.LBB17_25:
	jmp	.LBB17_27
.LBB17_26:
	movq	-56(%rbp), %rsi
	movq	-96(%rbp), %rdi         # 8-byte Reload
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm
	addq	$208, %rsp
	popq	%rbp
	retq
.LBB17_27:
	movq	-72(%rbp), %rdi
	callq	_Unwind_Resume
.LBB17_28:
.Ltmp100:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -204(%rbp)        # 4-byte Spill
	callq	__clang_call_terminate
.LBB17_29:
.Lfunc_end17:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag, .Lfunc_end17-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIN5boost9iterators18transform_iteratorINS6_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcS4_EENS7_11use_defaultESI_EEEEvT_SK_St18input_iterator_tag
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.align	4
GCC_except_table17:
.Lexception3:
	.byte	255                     # @LPStart Encoding = omit
	.byte	3                       # @TType Encoding = udata4
	.asciz	"\343\200"              # @TType base offset
	.byte	3                       # Call site Encoding = udata4
	.byte	91                      # Call site table length
	.long	.Lfunc_begin3-.Lfunc_begin3 # >> Call Site 1 <<
	.long	.Ltmp72-.Lfunc_begin3   #   Call between .Lfunc_begin3 and .Ltmp72
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp72-.Lfunc_begin3   # >> Call Site 2 <<
	.long	.Ltmp85-.Ltmp72         #   Call between .Ltmp72 and .Ltmp85
	.long	.Ltmp92-.Lfunc_begin3   #     jumps to .Ltmp92
	.byte	1                       #   On action: 1
	.long	.Ltmp85-.Lfunc_begin3   # >> Call Site 3 <<
	.long	.Ltmp93-.Ltmp85         #   Call between .Ltmp85 and .Ltmp93
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.long	.Ltmp93-.Lfunc_begin3   # >> Call Site 4 <<
	.long	.Ltmp96-.Ltmp93         #   Call between .Ltmp93 and .Ltmp96
	.long	.Ltmp97-.Lfunc_begin3   #     jumps to .Ltmp97
	.byte	0                       #   On action: cleanup
	.long	.Ltmp86-.Lfunc_begin3   # >> Call Site 5 <<
	.long	.Ltmp91-.Ltmp86         #   Call between .Ltmp86 and .Ltmp91
	.long	.Ltmp92-.Lfunc_begin3   #     jumps to .Ltmp92
	.byte	1                       #   On action: 1
	.long	.Ltmp98-.Lfunc_begin3   # >> Call Site 6 <<
	.long	.Ltmp99-.Ltmp98         #   Call between .Ltmp98 and .Ltmp99
	.long	.Ltmp100-.Lfunc_begin3  #     jumps to .Ltmp100
	.byte	1                       #   On action: 1
	.long	.Ltmp99-.Lfunc_begin3   # >> Call Site 7 <<
	.long	.Lfunc_end17-.Ltmp99    #   Call between .Ltmp99 and .Lfunc_end17
	.long	0                       #     has no landing pad
	.byte	0                       #   On action: cleanup
	.byte	1                       # >> Action Record 1 <<
                                        #   Catch TypeInfo 1
	.byte	0                       #   No further actions
                                        # >> Catch TypeInfos <<
	.long	0                       # TypeInfo 1
	.align	4

	.section	.text._ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE,"axG",@progbits,_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE,comdat
	.weak	_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE
	.align	16, 0x90
	.type	_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE,@function
_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE: # @_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp104:
	.cfi_def_cfa_offset 16
.Ltmp105:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp106:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	leaq	-32(%rbp), %rax
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	%rdi, -40(%rbp)         # 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -48(%rbp)         # 8-byte Spill
	callq	_ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv
	movq	-48(%rbp), %rdi         # 8-byte Reload
	movq	-40(%rbp), %rsi         # 8-byte Reload
	movq	%rax, -56(%rbp)         # 8-byte Spill
	callq	_ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE
	xorb	$-1, %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
.Lfunc_end18:
	.size	_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE, .Lfunc_end18-_ZN5boost9iteratorsneINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EEcNS0_27random_access_traversal_tagEclSJ_cSK_clEENS0_6detail23enable_if_interoperableIT_T4_NS_3mpl6apply2INSL_12always_bool2ESN_SO_E4typeEE4typeERKNS0_15iterator_facadeISN_T0_T1_T2_T3_EERKNSW_ISO_T5_T6_T7_T8_EE
	.cfi_endproc

	.section	.text._ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv,"axG",@progbits,_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv,comdat
	.weak	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv
	.align	16, 0x90
	.type	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv,@function
_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv: # @_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp107:
	.cfi_def_cfa_offset 16
.Ltmp108:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp109:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	movq	%rax, %rdi
	callq	_ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_
	movsbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end19:
	.size	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv, .Lfunc_end19-_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEdeEv
	.cfi_endproc

	.section	.text._ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv,"axG",@progbits,_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv,comdat
	.weak	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv
	.align	16, 0x90
	.type	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv,@function
_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv: # @_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp110:
	.cfi_def_cfa_offset 16
.Ltmp111:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp112:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)         # 8-byte Spill
	callq	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	movq	%rax, %rdi
	callq	_ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_
	movq	-16(%rbp), %rdi         # 8-byte Reload
	callq	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end20:
	.size	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv, .Lfunc_end20-_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EEppEv
	.cfi_endproc

	.section	.text._ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE,"axG",@progbits,_ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE,comdat
	.weak	_ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE
	.align	16, 0x90
	.type	_ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE,@function
_ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE: # @_ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp113:
	.cfi_def_cfa_offset 16
.Ltmp114:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp115:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdi
	movq	%rdi, -32(%rbp)         # 8-byte Spill
	movq	%rsi, %rdi
	movq	-32(%rbp), %rsi         # 8-byte Reload
	callq	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end21:
	.size	_ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE, .Lfunc_end21-_ZN5boost9iterators20iterator_core_access5equalINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EESK_EEbRKT_RKT0_N4mpl_5bool_ILb1EEE
	.cfi_endproc

	.section	.text._ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv,"axG",@progbits,_ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv,comdat
	.weak	_ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv
	.align	16, 0x90
	.type	_ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv,@function
_ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv: # @_ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp116:
	.cfi_def_cfa_offset 16
.Ltmp117:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp118:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$_ZZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEvE4data, %rax
	movq	%rdi, -8(%rbp)
	movq	%rax, %rdi
	callq	_ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end22:
	.size	_ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv, .Lfunc_end22-_ZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEv
	.cfi_endproc

	.section	.text._ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE,"axG",@progbits,_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE,comdat
	.weak	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE
	.align	16, 0x90
	.type	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE,@function
_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE: # @_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp119:
	.cfi_def_cfa_offset 16
.Ltmp120:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp121:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	%rdi, -24(%rbp)         # 8-byte Spill
	movq	%rsi, %rdi
	callq	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv
	movq	-24(%rbp), %rdi         # 8-byte Reload
	movq	%rax, %rsi
	callq	_ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end23:
	.size	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE, .Lfunc_end23-_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E5equalISJ_SH_cSI_cSI_EEbRKNS1_IT_T0_T1_T2_T3_T4_EE
	.cfi_endproc

	.section	.text._ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_,"axG",@progbits,_ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_,comdat
	.weak	_ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_
	.align	16, 0x90
	.type	_ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_,@function
_ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_: # @_ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp122:
	.cfi_def_cfa_offset 16
.Ltmp123:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp124:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	movq	(%rax), %rax
	movq	-16(%rbp), %rdi
	movq	%rax, -24(%rbp)         # 8-byte Spill
	callq	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	movq	-24(%rbp), %rsi         # 8-byte Reload
	cmpq	(%rax), %rsi
	sete	%cl
	andb	$1, %cl
	movzbl	%cl, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end24:
	.size	_ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_, .Lfunc_end24-_ZN9__gnu_cxxeqIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEbRKNS_17__normal_iteratorIT_T0_EESE_
	.cfi_endproc

	.section	.text._ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv,"axG",@progbits,_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv,comdat
	.weak	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv
	.align	16, 0x90
	.type	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv,@function
_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv: # @_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp125:
	.cfi_def_cfa_offset 16
.Ltmp126:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp127:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end25:
	.size	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv, .Lfunc_end25-_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv
	.cfi_endproc

	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv,comdat
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	.align	16, 0x90
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv,@function
_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv: # @_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp128:
	.cfi_def_cfa_offset 16
.Ltmp129:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp130:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end26:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv, .Lfunc_end26-_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE4baseEv
	.cfi_endproc

	.section	.text._ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_,"axG",@progbits,_ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_,comdat
	.weak	_ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_
	.align	16, 0x90
	.type	_ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_,@function
_ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_: # @_ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp131:
	.cfi_def_cfa_offset 16
.Ltmp132:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp133:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end27:
	.size	_ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_, .Lfunc_end27-_ZN5boost17integral_constantIbLb1EE11dereferenceIKN4mpl_5bool_ILb1EEEEERT_PS7_
	.cfi_endproc

	.section	.text._ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_,"axG",@progbits,_ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_,comdat
	.weak	_ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_
	.align	16, 0x90
	.type	_ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_,@function
_ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_: # @_ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp134:
	.cfi_def_cfa_offset 16
.Ltmp135:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp136:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv
	movsbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end28:
	.size	_ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_, .Lfunc_end28-_ZN5boost9iterators20iterator_core_access11dereferenceINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEENT_9referenceERKSL_
	.cfi_endproc

	.section	.text._ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv,"axG",@progbits,_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv,comdat
	.weak	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	.align	16, 0x90
	.type	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv,@function
_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv: # @_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp137:
	.cfi_def_cfa_offset 16
.Ltmp138:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp139:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, %rax
	popq	%rbp
	retq
.Lfunc_end29:
	.size	_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv, .Lfunc_end29-_ZNK5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	.cfi_endproc

	.section	.text._ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv,"axG",@progbits,_ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv,comdat
	.weak	_ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv
	.align	16, 0x90
	.type	_ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv,@function
_ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv: # @_ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp140:
	.cfi_def_cfa_offset 16
.Ltmp141:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp142:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, %rax
	addq	$8, %rax
	movq	%rax, -16(%rbp)         # 8-byte Spill
	callq	_ZNK5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E4baseEv
	movq	%rax, %rdi
	callq	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	movq	-16(%rbp), %rdi         # 8-byte Reload
	movsbl	(%rax), %esi
	callq	_ZNK5boost9algorithm6detail9to_upperFIcEclEc
	movsbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end30:
	.size	_ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv, .Lfunc_end30-_ZNK5boost9iterators18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESH_E11dereferenceEv
	.cfi_endproc

	.section	.text._ZNK5boost9algorithm6detail9to_upperFIcEclEc,"axG",@progbits,_ZNK5boost9algorithm6detail9to_upperFIcEclEc,comdat
	.weak	_ZNK5boost9algorithm6detail9to_upperFIcEclEc
	.align	16, 0x90
	.type	_ZNK5boost9algorithm6detail9to_upperFIcEclEc,@function
_ZNK5boost9algorithm6detail9to_upperFIcEclEc: # @_ZNK5boost9algorithm6detail9to_upperFIcEclEc
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp143:
	.cfi_def_cfa_offset 16
.Ltmp144:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp145:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdi
	movb	-9(%rbp), %al
	movq	(%rdi), %rsi
	movsbl	%al, %edi
	callq	_ZSt7toupperIcET_S0_RKSt6locale
	movsbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end31:
	.size	_ZNK5boost9algorithm6detail9to_upperFIcEclEc, .Lfunc_end31-_ZNK5boost9algorithm6detail9to_upperFIcEclEc
	.cfi_endproc

	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv,comdat
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	.align	16, 0x90
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv,@function
_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv: # @_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp146:
	.cfi_def_cfa_offset 16
.Ltmp147:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp148:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rax
	popq	%rbp
	retq
.Lfunc_end32:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv, .Lfunc_end32-_ZNK9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEdeEv
	.cfi_endproc

	.section	.text._ZSt7toupperIcET_S0_RKSt6locale,"axG",@progbits,_ZSt7toupperIcET_S0_RKSt6locale,comdat
	.weak	_ZSt7toupperIcET_S0_RKSt6locale
	.align	16, 0x90
	.type	_ZSt7toupperIcET_S0_RKSt6locale,@function
_ZSt7toupperIcET_S0_RKSt6locale:        # @_ZSt7toupperIcET_S0_RKSt6locale
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp149:
	.cfi_def_cfa_offset 16
.Ltmp150:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp151:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movb	%dil, %al
	movb	%al, -1(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale
	movq	%rax, %rdi
	movsbl	-1(%rbp), %esi
	callq	_ZNKSt5ctypeIcE7toupperEc
	movsbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end33:
	.size	_ZSt7toupperIcET_S0_RKSt6locale, .Lfunc_end33-_ZSt7toupperIcET_S0_RKSt6locale
	.cfi_endproc

	.section	.text._ZNKSt5ctypeIcE7toupperEc,"axG",@progbits,_ZNKSt5ctypeIcE7toupperEc,comdat
	.weak	_ZNKSt5ctypeIcE7toupperEc
	.align	16, 0x90
	.type	_ZNKSt5ctypeIcE7toupperEc,@function
_ZNKSt5ctypeIcE7toupperEc:              # @_ZNKSt5ctypeIcE7toupperEc
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp152:
	.cfi_def_cfa_offset 16
.Ltmp153:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp154:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rcx
	movq	16(%rcx), %rcx
	movsbl	-9(%rbp), %esi
	callq	*%rcx
	movsbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end34:
	.size	_ZNKSt5ctypeIcE7toupperEc, .Lfunc_end34-_ZNKSt5ctypeIcE7toupperEc
	.cfi_endproc

	.section	.text._ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_,"axG",@progbits,_ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_,comdat
	.weak	_ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_
	.align	16, 0x90
	.type	_ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_,@function
_ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_: # @_ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp155:
	.cfi_def_cfa_offset 16
.Ltmp156:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp157:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end35:
	.size	_ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_, .Lfunc_end35-_ZN5boost9iterators20iterator_core_access9incrementINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEEEvRT_
	.cfi_endproc

	.section	.text._ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv,"axG",@progbits,_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv,comdat
	.weak	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	.align	16, 0x90
	.type	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv,@function
_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv: # @_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp158:
	.cfi_def_cfa_offset 16
.Ltmp159:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp160:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, %rax
	popq	%rbp
	retq
.Lfunc_end36:
	.size	_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv, .Lfunc_end36-_ZN5boost9iterators6detail20iterator_facade_baseINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESJ_EEcNS0_27random_access_traversal_tagEclLb0ELb0EE7derivedEv
	.cfi_endproc

	.section	.text._ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv,"axG",@progbits,_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv,comdat
	.weak	_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv
	.align	16, 0x90
	.type	_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv,@function
_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv: # @_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp161:
	.cfi_def_cfa_offset 16
.Ltmp162:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp163:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	movq	%rax, -16(%rbp)         # 8-byte Spill
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end37:
	.size	_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv, .Lfunc_end37-_ZN5boost9iterators16iterator_adaptorINS0_18transform_iteratorINS_9algorithm6detail9to_upperFIcEEN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEENS0_11use_defaultESI_EESH_cSI_cSI_E9incrementEv
	.cfi_endproc

	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv,comdat
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	.align	16, 0x90
	.type	_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv,@function
_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv: # @_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp164:
	.cfi_def_cfa_offset 16
.Ltmp165:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp166:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rax
	addq	$1, %rax
	movq	%rax, (%rdi)
	movq	%rdi, %rax
	popq	%rbp
	retq
.Lfunc_end38:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv, .Lfunc_end38-_ZN9__gnu_cxx17__normal_iteratorIPKcNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEppEv
	.cfi_endproc

	.section	.text.startup,"ax",@progbits
	.align	16, 0x90
	.type	_GLOBAL__sub_I_boost_test.cpp,@function
_GLOBAL__sub_I_boost_test.cpp:          # @_GLOBAL__sub_I_boost_test.cpp
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp167:
	.cfi_def_cfa_offset 16
.Ltmp168:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp169:
	.cfi_def_cfa_register %rbp
	callq	__cxx_global_var_init
	popq	%rbp
	retq
.Lfunc_end39:
	.size	_GLOBAL__sub_I_boost_test.cpp, .Lfunc_end39-_GLOBAL__sub_I_boost_test.cpp
	.cfi_endproc

	.type	_ZStL8__ioinit,@object  # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Boost C++ Library"
	.size	.L.str, 18

	.type	_ZZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEvE4data,@object # @_ZZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEvE4data
	.section	.rodata._ZZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEvE4data,"aG",@progbits,_ZZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEvE4data,comdat
	.weak	_ZZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEvE4data
_ZZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEvE4data:
	.byte	0                       # 0x0
	.size	_ZZNK5boost17integral_constantIbLb1EEcvRKN4mpl_5bool_ILb1EEEEvE4data, 1

	.section	.init_array,"aw",@init_array
	.align	8
	.quad	_GLOBAL__sub_I_boost_test.cpp

	.ident	"clang version 3.8.1-18 (tags/RELEASE_381/final)"
	.section	".note.GNU-stack","",@progbits
